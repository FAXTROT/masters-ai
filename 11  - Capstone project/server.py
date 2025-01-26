from http.server import BaseHTTPRequestHandler, HTTPServer
import json

from DB import DatabaseManager


class MyHandler(BaseHTTPRequestHandler):

    def __init__(self, *args, **kwargs):
        self.db = DatabaseManager()
        super().__init__(*args, **kwargs)

    def exit(self):
        self.db.close()

    def do_GET(self):
        if self.path == '/api/hello':
            # Prepare a JSON response
            response = {
                "message": "Hello, world!",
                "success": True
            }
            # Send response status code and headers
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            # Send the JSON response
            self.wfile.write(json.dumps(response).encode('utf-8'))
        else:
            # Handle other GET requests (404 Not Found)
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'{"error": "Not Found"}')

    def do_POST(self):
        if self.path == '/api/echo':
            # Read the request body
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            # Echo back the received data
            response = {
                "received": json.loads(post_data.decode('utf-8'))
            }
            # Send response
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            self.wfile.write(json.dumps(response).encode('utf-8'))
        elif self.path == '/api/retrieve':
            # Read the request body
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            # Echo back the received data
            request = json.loads(post_data.decode('utf-8'))["request"]
            data = self.db.get_data(request)
            response = {
                "data": data
            }
            # Send response
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            self.wfile.write(json.dumps(response).encode('utf-8'))
        elif self.path == '/api/order':
            # Read the request body
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            # Echo back the received data
            req = json.loads(post_data.decode('utf-8'))
            item_id, quantity = req["item_id"], req["quantity"]
            status = "SUCCESS"
            try:
                self.db.put_order(item_id, quantity)
            except Exception as e:
                status = str(e)
            response = {
                "STATUS": status
            }
            # Send response
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.end_headers()
            self.wfile.write(json.dumps(response).encode('utf-8'))
        else:
            # Handle other POST requests (404 Not Found)
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'{"error": "Not Found"}')

def run(server_class=HTTPServer, handler_class=MyHandler, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f"Serving on port {port}...")
    httpd.serve_forever()

if __name__ == "__main__":
    db = DatabaseManager()
    db.populate_data()
    del db
    run()
