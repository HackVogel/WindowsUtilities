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
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator" /v ShutdownFlyoutOptions /t REG_DWORD /d 0xf /f
echo You can now normally shutdown/restart your computer without forced windows updates!
pause