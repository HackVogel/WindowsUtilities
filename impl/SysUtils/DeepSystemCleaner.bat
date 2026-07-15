@echo off
title WindowsUtilities - Deep System Clean
color 0B

@echo off
cls

net session >nul 2>&1
if '%errorlevel%' == '0' goto :gotAdmin

echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c """"%~s0"""" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin

echo ==================================================
echo               Deep System Clean
echo ==================================================
echo.

echo [INFO] Clearing User temp folder...
del /q /f /s "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo [INFO] Clearing Windows temp folder...
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1

echo [INFO] Clearing Windows-Prefetch-Cache...
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1

echo [INFO] Clearing Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
color a
echo [SUCCESS] System has been Cleaned...
timeout /t 3 /NOBREAK>NUL
exit