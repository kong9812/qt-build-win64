# Copyright (c) 2025 kong9812
cmake_minimum_required(VERSION 3.22)

# Project settings
project(MyQtProject VERSION 1.0 LANGUAGES CXX)
set(APP_NAME "MyQtApp")

# Use C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

# Enable strict MSVC behavior
if (MSVC)
    add_compile_options(/Zc:__cplusplus /permissive-)
endif()

# Specify Qt6 path if built manually
set(Qt6_DIR "${PROJECT_SOURCE_DIR}/qt/qtbase/lib/cmake/Qt6")

# Find Qt6 modules
find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets)

# Create the executable
add_executable(${APP_NAME} main.cpp)

# Link Qt libraries
target_link_libraries(${APP_NAME}
    PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
)

# Include Qt headers if needed
target_include_directories(${APP_NAME}
    PRIVATE
    "${PROJECT_SOURCE_DIR}/qt/qtbase/include"
)

# Copy Qt runtime DLLs to output folder after build
add_custom_command(TARGET ${APP_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:Qt6::Core>
        $<TARGET_FILE:Qt6::Gui>
        $<TARGET_FILE:Qt6::Widgets>
        $<TARGET_FILE_DIR:${APP_NAME}>
)

# Copy Qt platforms plugin directory
add_custom_command(TARGET ${APP_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory
        $<TARGET_FILE_DIR:${APP_NAME}>/platforms

    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<$<CONFIG:Debug>:${PROJECT_SOURCE_DIR}/qt/qtbase/plugins/platforms/qwindowsd.dll>
        $<$<CONFIG:Release>:${PROJECT_SOURCE_DIR}/qt/qtbase/plugins/platforms/qwindows.dll>
        $<TARGET_FILE_DIR:${APP_NAME}>/platforms
)