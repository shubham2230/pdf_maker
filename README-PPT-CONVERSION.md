# PowerPoint to PDF Conversion with LibreOffice Docker

This document explains how to set up and use the PowerPoint to PDF conversion system that utilizes LibreOffice running in a Docker container for high-quality conversions.

## System Architecture

The system consists of:

1. **Frontend**: Browser-based HTML/JavaScript interface
2. **Conversion Server**: Python Flask server that handles file uploads
3. **LibreOffice Docker Container**: Performs the actual conversion from PowerPoint to PDF

## Installation Requirements

- Docker
- Python 3.7 or higher
- Web browser

## Setup Instructions

### 1. Start the LibreOffice Docker Container

```bash
docker run -d -p 2002:2002 --name libreoffice lscr.io/linuxserver/libreoffice
```

This command pulls and runs the LinuxServer.io LibreOffice container, exposing port 2002.

### 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

### 3. Start the Conversion Server

```bash
python ppt_conversion_server.py
```

The server will start on port 5000 by default.

### 4. Open the Web Interface

Open the `index.html` file in your web browser and navigate to the PowerPoint to PDF conversion tool.

## How It Works

1. User uploads a PowerPoint file (.ppt or .pptx) through the web interface
2. The file is sent to the Python Flask server
3. The server forwards the file to the LibreOffice Docker container
4. LibreOffice converts the presentation to PDF
5. The PDF is returned to the browser for download

## Fallback Mechanisms

The system includes fallback mechanisms:

1. If the Docker container is unavailable, it attempts to use locally installed LibreOffice
2. If server-side conversion fails, it falls back to a client-side simulation

## Troubleshooting

### LibreOffice Container Issues

- Verify the container is running: `docker ps | grep libreoffice`
- Check container logs: `docker logs libreoffice`
- Restart the container: `docker restart libreoffice`

### Conversion Server Issues

- Check the conversion server logs for errors
- Verify network access to the LibreOffice container (port 2002)
- Ensure you have the required Python packages installed

## Security Considerations

- The conversion server only accepts PowerPoint files (.ppt, .pptx)
- Temporary files are cleaned up after conversion
- No files are permanently stored on the server

## Performance Considerations

- The first conversion may be slower as LibreOffice initializes
- Subsequent conversions should be faster
- Large presentations may take longer to convert 