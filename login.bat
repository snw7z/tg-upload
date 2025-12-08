@echo off
setlocal ENABLEDELAYEDEXPANSION

:: Define janela e cores
mode con: cols=80 lines=25
color 0A
cls

echo.
echo Checking for required Python dependencies...
pip install httpx
if errorlevel 1 (
    echo Warning: Failed to install 'httpx'. Please ensure pip is installed.
)
echo.

:: Cabeçalho
echo ================================================================================
echo                         TG-UPLOAD INTERACTIVE LOGIN
echo ================================================================================
echo.

echo Enter Profile Name:
color 0E
set /P "PROFILE_NAME=> "
color 0A

echo Enter API ID:
color 0E
set /P "API_ID=> "
color 0A

echo Enter API Hash:
color 0E
set /P "API_HASH=> "
color 0A

echo.
echo Enter your phone number in international format (e.g., +55XX9XXXXXXXXX)
color 0E
set /P "PHONE_NUMBER=> "
color 0A

echo.
echo Executing login command...
echo.

python tg-upload.py --profile %PROFILE_NAME% --api_id %API_ID% --api_hash %API_HASH% --phone %PHONE_NUMBER% --login_only

echo.
echo ================================================================================
echo                         LOGIN PROCESS COMPLETED.
echo ================================================================================
echo.

endlocal
pause
