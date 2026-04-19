@echo off
title PluxoDropBot
cd /d "%~dp0"

echo === PluxoDropBot ===
echo Folder: %CD%
echo.

where py >nul 2>nul
if %ERRORLEVEL%==0 (
    set PY=py -3
) else (
    set PY=python
)

echo Checking dependencies...
%PY% -m pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to install dependencies. See messages above.
    pause
    exit /b 1
)

echo.
echo Starting bot... (close this window or press Ctrl+C to stop)
echo.
%PY% main.py
set EXITCODE=%ERRORLEVEL%

echo.
echo ===============================================
echo Bot exited with code %EXITCODE%
echo ===============================================
pause
