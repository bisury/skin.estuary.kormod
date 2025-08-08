@echo off
setlocal enabledelayedexpansion

set "ADDON_NAME=skin.estuary.kormod"
set "ZIP_FILE=..\%ADDON_NAME%.zip"
set "TEMP_DIR=..\_temp_build_%ADDON_NAME%"

REM --- Cleanup ---
echo Cleaning up previous build...
if exist "%ZIP_FILE%" del "%ZIP_FILE%"
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"

REM --- Create temporary directory and copy files ---
echo Creating temporary directory...
mkdir "%TEMP_DIR%"

echo Creating exclude file list...
(
    echo .git\
    echo .gitignore
    echo build.bat
    echo *.zip
    echo diff.patch
    echo _temp_build*
    echo exclude.txt
) > exclude.txt

echo Copying files to temporary directory...
xcopy . "%TEMP_DIR%\%ADDON_NAME%\" /E /I /Y /Q /EXCLUDE:exclude.txt

REM --- Create Zip Archive ---
echo Creating zip archive...
pushd "%TEMP_DIR%"
tar -acf "%ADDON_NAME%.zip" "%ADDON_NAME%"
popd

REM --- Move zip file and cleanup ---
echo Moving zip file...
move "%TEMP_DIR%\%ADDON_NAME%.zip" "%ZIP_FILE%"

echo Cleaning up temporary files...
rmdir /s /q "%TEMP_DIR%"
del exclude.txt

echo.
echo Addon package created successfully: %ZIP_FILE%
pause