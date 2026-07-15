@echo off
title WindowsUtilities - Clear Clipboard
color 0B

echo ==================================================
echo              Clearing Clipboard...
echo ==================================================
echo.

echo off | clip

color a
echo [SUCCESS] Clipboard has been cleared
echo.
timeout /t 2 >nul
exit