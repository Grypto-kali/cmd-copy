@echo off
:: Check if the script is run with administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Requesting administrative privileges...
    echo.
    :: Request administrative privileges
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

:: Define source and target directories
set "SOURCE=C:\"
set "COMPUTERNAME=%COMPUTERNAME%"
set "TARGET=%~dp0%COMPUTERNAME%"

:: Create the target directory if it does not exist
if not exist "%TARGET%" mkdir "%TARGET%"

:: Output paths for debugging
echo Source: %SOURCE%
echo Target: %TARGET%

:: Copy files excluding the Windows directory
for /d %%D in ("%SOURCE%*") do (
    if /I "%%~nxD" neq "Windows" (
        xcopy "%%D" "%TARGET%\%%~nxD" /E /C /R /I /K /Y /H
    )
)

:: Wait a moment to ensure the copy operation is completed
timeout /t 5 /nobreak > nul

:: Check the exit code of xcopy
if %errorlevel% leq 1 (
    echo Copy complete!
) else (
    echo An error occurred during the copy process.
)

pause
