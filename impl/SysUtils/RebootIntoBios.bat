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
shutdown -r -fw -t 3 -c "Your computer will reboot into the BIOS/UEFI in 3 seconds."
pause