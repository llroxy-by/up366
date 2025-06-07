@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM Prompt user to input the target folder path
set /p "target_folder=target folder path: "

REM Set the specific audio file path (relative path)
set "specific_audio=./init.mp3"

REM Check if the target folder exists
if not exist "%target_folder%" (
    echo 你输入的不对喵~
    pause
    exit /b
)

REM Check if the specific audio file exists
if not exist "%specific_audio%" (
    echo 文件有问题喵~
    pause
    exit /b
)

REM Traverse all .mp3 files in the target folder and its subfolders
for /r "%target_folder%" %%f in (*.mp3) do (
    REM Get the filename (without extension)
    set "filename=%%~nf"
    REM Get the file directory
    set "filedir=%%~dpf"

    REM Copy the specific audio file to the target folder and rename it to the original filename
    copy /y "%specific_audio%" "!filedir!\!filename!.mp3" >nul

    echo Replaced: %%f
)

echo All .mp3 files have been replaced! 灌注llroxy谢谢喵~
pause
