import http.server
import socketserver
import os

# Set the port
PORT = 8000

# Ensure the current directory is the server's directory
os.chdir(os.path.dirname(os.path.abspath(__file__)))

# Create a simple handler that serves files
handler = http.server.SimpleHTTPRequestHandler

# Create the server
with socketserver.TCPServer(("", PORT), handler) as httpd:
    print(f"Server running at http://localhost:{PORT}")
    print(f"Press Ctrl+C to stop the server")
    
    # Serve until interrupted
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nServer stopped.") 