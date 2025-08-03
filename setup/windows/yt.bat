@echo off
setlocal EnableDelayedExpansion


set "CONFIG_FILE=%~dp0yt_config.txt"

if not exist "!CONFIG_FILE!" (
    echo Please enter the FULL path to the folder where downloads should be saved:

    set /p DOWNLOAD_DIR=Folder: 

    if "!DOWNLOAD_DIR!"=="" (
        echo.
        echo ❌ No path entered. Exiting.
        exit /b 1
    )

    echo !DOWNLOAD_DIR! > "!CONFIG_FILE!"
) else (
    set /p DOWNLOAD_DIR=<"!CONFIG_FILE!"
)

if not exist "!DOWNLOAD_DIR!" (
    mkdir "!DOWNLOAD_DIR!"
)

cd /d "!DOWNLOAD_DIR!" || (
    echo ❌ Failed to change directory to "!DOWNLOAD_DIR!"
    exit /b 1
)

"D:\yt-dlp\yt-dlp.exe" %*


set "ARGS=%*"

echo %ARGS% | findstr /i "youtube.com youtu.be" >nul
set "HAS_YT_LINK=%errorlevel%"


echo %ARGS% | findstr /i /c:"--list-formats" >nul
set "HAS_LIST_FORMATS=%errorlevel%"


if %HAS_YT_LINK%==0 if not %HAS_LIST_FORMATS%==0 (
    start "" "!DOWNLOAD_DIR!"
)

endlocal
