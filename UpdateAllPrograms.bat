@echo off

cls

title Program updater 1.0 (github.com/HackVogel/WindowsUtilities)

:menu
echo =================================================
echo                Program Updater
echo.
echo   https://Github.com/HackVogel/WindowsUtilities
echo.
echo =================================================
echo.
echo Press 1 to check for updates
echo Press 2 to update all programs
echo Press 3 to Exit
echo.

choice /C 123 /N /M "Select an option > "

if errorlevel 3 goto exit
if errorlevel 2 goto update_programs
if errorlevel 1 goto check_for_updates

goto menu

:update_programs
winget upgrade --all
goto menu

:check_for_updates
winget upgrade
echo do you want to update all programs?
choice /C 12 /N /M "1 for yes 2 for no > "

if errorlevel 2 goto exit
if errorlevel 1 goto update_programs

:exit
echo see you soon
timeout /t 2 /NOBREAK>nul
exit