import http.server
import socketserver
import os
import webbrowser

PORT = 3000

class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()

# Set up the handler to serve files from the current directory
handler = MyHttpRequestHandler
httpd = socketserver.TCPServer(("", PORT), handler)

print(f"Server running at http://localhost:{PORT}")
print("Press Ctrl+C to stop the server")

# Open the browser automatically
webbrowser.open(f'http://localhost:{PORT}')

# Start the server
httpd.serve_forever() 