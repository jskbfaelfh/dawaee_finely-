@echo off
chcp 65001 >nul
title دوائي - منظومة إدارة الصيدليات

cd /d "%~dp0"

:: Check if port 4000 is already running
netstat -ano | findstr ":4000 " | findstr "LISTENING" >nul
if %errorlevel% neq 0 (
    echo [دوائي] جاري تهيئة خادم المنظومة في الخلفية...
    set "NODE_ENV=development"
    start /b "" "C:\Program Files\nodejs\node.exe" phar\backend\dist\src\main.js
    timeout /t 3 /nobreak >nul
)

:: Launch desktop application
start "" "phar\electron\release\win-unpacked\دوائي.exe"
exit
