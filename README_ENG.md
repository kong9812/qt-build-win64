# Qt Windows Build & Sample Project
[日本語](./README)  
This project provides a **template for building Qt from source on Windows** and creating a simple **Qt sample application**.  
It uses Visual Studio and CMake for building and development.

---

## 📦 Features

- Automated source build of Qt (qtbase only)  
- Generates a CMake project for Visual Studio  
- Automatically copies the Qt platform plugin (`qwindows.dll`)  
- Provides a simple base project for Qt development with CMake  

---

## 📁 Final Directory Structure

```
project-root/
├── .qt/                        # Qt source code (cloned here)
├── qt/                         # Built Qt library
├── bin/                        # Build output of the sample application
├── buildQtAndCreateSampleProject.bat  # Batch script to build Qt and the sample app
├── cmakeBuild.bat             # Script for building with CMake
├── CMakeLists.txt             # CMake project file
├── main.cpp                   # Entry point for the Qt sample app
├── README.md                  # This file
└── .gitignore                 # Git ignore list
```

---

## 🛠️ Requirements

- Windows 10 / 11  
- Visual Studio (2022 / 2019 / other supported versions)  
- Git  
- CMake >= 3.22  

---

## 🚀 How to Build

### 1. Build Qt and the Sample Application

Simply run the batch file:

```bat
buildQtAndCreateSampleProject.bat
```

This script will automatically:

- Clone Qt v6.9.0 into the `.qt/` folder  
- Build the `qtbase` module into the `qt/` directory  
- Build the sample application and output it into the `bin/` folder  
- Automatically copy the required Qt platform plugin (`qwindows.dll`) into the `platforms/` directory  

---

## 🔧 Changing Visual Studio Version

### Default Configuration

```bat
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
cmake -G "Visual Studio 17 2022"
```

### To use a different version:

- **Visual Studio 2019:**

```bat
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
cmake -G "Visual Studio 16 2019"
```

- **If using Enterprise / Professional editions:**  
  Replace `Community` with `Enterprise` or `Professional` in the path above.

---

## ⚠️ Notes

- To use other Qt modules (besides Widgets), modify the arguments passed to `configure.bat`.
- The required platform plugin (`qwindows.dll`) is automatically copied to `./bin/platforms/`.  
  You do **not** need to set the `QT_QPA_PLATFORM_PLUGIN_PATH` environment variable manually.

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).  
However, Qt itself is distributed under **LGPL or GPL**.  
Please consult the official Qt license terms for redistribution or commercial use.