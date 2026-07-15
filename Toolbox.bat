@echo off
cls

title WindowsUtilities - Toolbox Version ; github.com/HackVogel/WindowsUtilities

echo ===================================================
echo.
echo         WindowsUtilities Toolbox 1.2
echo.
echo    https://GitHub.com/HackVogel/WindowsUtilities
echo.
echo ===================================================

echo 1. Bypass forced WindowsUpdates
echo 2. Reboot into the BIOS/UEFI
echo 3. Deep System cleaner
echo 4. System Uptime
echo.
echo =================================
echo.
echo 5. Clear your Clipboard
echo 6. Program Updater
echo.
echo 7. Utility Updater
echo 8. Exit
echo.
echo =================================
echo.
echo.

choice /C 12345678 /N /M "Select an option > "

if errorlevel 8 exit
if errorlevel 7 call "%~dp0util.bat"
if errorlevel 6 call "%~dp0impl\UserUtils\UpdateAllPrograms.bat"
if errorlevel 5 call "%~dp0impl\UserUtils\ClearClipboard.bat"
if errorlevel 4 call "%~dp0impl\SysUtils\SystemUptime.bat"
if errorlevel 3 call "%~dp0impl\SysUtils\DeepSystemCleaner.bat"
if errorlevel 2 call "%~dp0impl\SysUtils\RebootIntoBios.bat"
if errorlevel 1 call "%~dp0impl\SysUtils\BypassForcedWindowsUpdates.bat"