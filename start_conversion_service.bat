@echo off
echo Starting PowerPoint to PDF Conversion System
echo ==========================================

REM Check if Docker is installed
where docker >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: Docker is not installed. Please install Docker first.
    pause
    exit /b 1
)

REM Check if the LibreOffice container exists
docker ps -a | findstr "libreoffice" >nul
if %ERRORLEVEL% neq 0 (
    echo Creating LibreOffice Docker container...
    docker run -d -p 2002:2002 --name libreoffice lscr.io/linuxserver/libreoffice
) else (
    REM Check if the container is running
    docker ps | findstr "libreoffice" >nul
    if %ERRORLEVEL% neq 0 (
        echo Starting existing LibreOffice Docker container...
        docker start libreoffice
    ) else (
        echo LibreOffice Docker container is already running.
    )
)

REM Wait for the container to be ready
echo Waiting for LibreOffice container to initialize...
timeout /t 5 /nobreak >nul

REM Check if Python is installed
where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Error: Python is not installed. Please install Python 3.7 or higher.
    pause
    exit /b 1
)

REM Install dependencies
echo Installing Python dependencies...
pip install -r requirements.txt
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to install Python dependencies.
    pause
    exit /b 1
)

REM Start the conversion server
echo Starting conversion server...
echo The server will be available at http://localhost:5000
echo Press Ctrl+C to stop the server.

REM Start the Python server
python ppt_conversion_server.py 