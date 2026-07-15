@echo off
title WindowsUtilities - Update Checker
color 0B

cd /d "%~dp0"

echo ==================================================
echo         WindowsUtilities - Update Checker
echo ==================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo install "Git for Windows" to use this update function!
    echo.
    echo do you want to install git now? 1: yes 2: no
    choice /C 12 /N /M "Select an option > "
    if errorlevel 2 pause
    if errorlevel 1 winget install git.git
    exit /b
)

if not exist ".git" (
    echo [ERROR] .git folder doesn't exist!
    echo Download this with git clone https://github.com/hackvogel/WindowsUtilities to use the update function
    echo.
    pause
    exit /b
)

echo [INFO] Connecting to github and search for some updates...
git fetch >nul 2>nul

git status -uno | find /i "is behind" >nul

if %errorlevel% equ 0 (
    echo [INFO] Update available! Updating...
    echo.
    
    git pull
    
    echo.
    echo [SUCCESS] WindowsUtilities has been updated. Open CHANGELOG.MD to see whats new! 
) else (
    echo [INFO] No update available
    timeout /t 2 /NOBREAK>NUL
    exit
)

echo.