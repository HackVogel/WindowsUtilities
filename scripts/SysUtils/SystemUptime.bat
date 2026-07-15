@echo off
title WindowsUtilities - System Uptime
color 0B

echo ==================================================
echo                  System Uptime
echo ==================================================
echo.

echo [INFO] Get System uptime...
echo.

powershell -NoProfile -Command "$Uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime; Write-Host 'Dein PC laeuft seit: ' -NoNewline -ForegroundColor Cyan; Write-Host ($Uptime.Days.ToString() + ' Tagen, ' + $Uptime.Hours.ToString() + ' Stunden und ' + $Uptime.Minutes.ToString() + ' Minuten.') -ForegroundColor White"

echo.
pause