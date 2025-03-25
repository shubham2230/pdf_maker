#!/bin/bash

echo "Starting PowerPoint to PDF Conversion System"
echo "=========================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if the LibreOffice container exists
if ! docker ps -a | grep -q "libreoffice"; then
    echo "Creating LibreOffice Docker container..."
    docker run -d -p 2002:2002 --name libreoffice lscr.io/linuxserver/libreoffice
else
    # Check if the container is running
    if ! docker ps | grep -q "libreoffice"; then
        echo "Starting existing LibreOffice Docker container..."
        docker start libreoffice
    else
        echo "LibreOffice Docker container is already running."
    fi
fi

# Wait for the container to be ready
echo "Waiting for LibreOffice container to initialize..."
sleep 5

# Check if Python is installed
if ! command -v python &> /dev/null && ! command -v python3 &> /dev/null; then
    echo "Error: Python is not installed. Please install Python 3.7 or higher."
    exit 1
fi

# Check if requirements are installed
PYTHON_CMD="python"
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
fi

echo "Installing Python dependencies..."
pip install -r requirements.txt || {
    echo "Error: Failed to install Python dependencies."
    exit 1
}

# Start the conversion server
echo "Starting conversion server..."
echo "The server will be available at http://localhost:5000"
echo "Press Ctrl+C to stop the server."

# Start the Python server
$PYTHON_CMD ppt_conversion_server.py 