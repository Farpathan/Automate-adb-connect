@echo off
setlocal

REM Kill the ADB server
adb kill-server

REM Initialize variables
set "adb_address=192.168.0.107"
set "user_choice="

REM Check if there's a stored address
if exist adb_address.txt (
    set /p adb_address=<adb_address.txt
)

REM Ask user if they want to change the address
echo Current ADB address: %adb_address%
set /p user_choice="Do you want to change the last part of the address? (y/n): "
if /i "%user_choice%"=="y" (
    set /p adb_address="Enter the new ADB address: "
    echo %adb_address% > adb_address.txt
)

REM Connect to ADB
adb connect %adb_address%

REM List devices
adb devices

pause
