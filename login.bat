@echo off
setlocal ENABLEDELAYEDEXPANSION

:: Define janela e cores
mode con: cols=80 lines=25
color 0A
cls

:: Cabeçalho
echo ================================================================================
echo                         TG-UPLOAD INTERACTIVE LOGIN
echo ================================================================================
echo.

:: 1. Request profile name
echo Enter Profile Name:
color 0E
set /P "PROFILE_NAME=> "
color 0A

:: 2. Request API ID
echo Enter API ID:
color 0E
set /P "API_ID=> "
color 0A

:: 3. Request API Hash
echo Enter API Hash:
color 0E
set /P "API_HASH=> "
color 0A

:: 4. Request phone number
echo.
echo Enter your phone number in international format (e.g., +55XX9XXXXXXXXX)
color 0E
set /P "PHONE_NUMBER=> "
color 0A

:: 5. Execute login
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
