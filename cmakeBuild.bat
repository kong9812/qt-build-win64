:: Copyright (c) 2025 kong9812
@echo off

:: Define build output directory
set BUILD_DIR=bin

:: Create build directory if it doesn't exist
if not exist "%BUILD_DIR%" (
    mkdir "%BUILD_DIR%"
)

:: Configure the project with CMake using Visual Studio generator
cmake -S "./" -B "%BUILD_DIR%" -G "Visual Studio 17 2022"