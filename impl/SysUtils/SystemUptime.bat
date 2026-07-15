@echo off
title WindowsUtilities - System Uptime
color 0B

echo ==================================================
echo                  System Uptime
echo ==================================================
echo.

echo [INFO] Get System uptime...
echo.

powershell -NoProfile -Command "$Uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; Write-Host 'System uptime: ' -NoNewline -ForegroundColor Cyan; Write-Host ($Uptime.Days.ToString() + ' Days, ' + $Uptime.Hours.ToString() + ' Hour and ' + $Uptime.Minutes.ToString() + ' Minutes.') -ForegroundColor White"

echo.
pause