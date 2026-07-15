@echo off
cls

title WindowsUtilities - Spicetify Installer

powershell -command "iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex"
