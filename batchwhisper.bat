@echo off
setlocal enabledelayedexpansion

echo Checking if Whisper is installed...
where "whisper.exe" >nul
if not errorlevel 1 (
    echo Whisper is installed.
) else (
    echo "Unable to run. Whisper might not be installed, in the system PATH, the user does not have sufficient permissions to access the file system, or another reason. Exiting..."
    pause >nul
    exit /b 1
)

echo Do you want to include subdirectories? (Y/N, default is N)
set "include_subdirs=no"

choice /c YN /t 10 /d N /m "Include subdirectories [Y/N]: "
if errorlevel 2 (
    set "include_subdirs=no"
) else if errorlevel 1 (
    set "include_subdirs=yes"
)

set "log_error=false"

set /a "total_files=0"
set /a "processed_files=0"
set /a "skipped_files=0"

if /i "%include_subdirs%"=="yes" (
    for /R %%A in (*.mp3;*.wav) do (
        set /a "total_files+=1"
    )
) else (
    for %%A in (*.mp3;*.wav) do (
        set /a "total_files+=1"
    )
)

if /i "%include_subdirs%"=="yes" (
    for /R %%A in (*.mp3;*.wav) do (
        set "audio_file=%%A"
        call :process_file
    )
) else (
    for %%A in (*.mp3;*.wav) do (
        set "audio_file=%%A"
        call :process_file
    )
)

if %log_error%==true (
    set "log_file=log_%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.txt"
    echo Script started: %date% %time% > "%log_file%"
    echo Total files: %total_files% >> "%log_file%"
    echo Skipped files: %skipped_files% >> "%log_file%"
    type "%log_file%" | findstr /C:"Error: Failed"
    echo There were errors during processing. Check the log file for details.
)

goto :eof

set "start_time=%time%"
for %%F in ("!audio_file!") do set "output_path=%%~dpF"
set "output_path=%output_path:\=\\%"
whisper "!audio_file!" --model medium.en --output_format vtt --output_dir "!output_path!" 2> nul

if errorlevel 1 (
    echo Error: Failed to process "!audio_file!" using the whisper command.
    set /a "skipped_files+=1"
    set "log_error=true"
    goto :eof
) else (
    echo Successfully processed "!audio_file!".
)

goto :eof
