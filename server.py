#!/usr/bin/env python
# Start web server in current directory
# (may be useful for previewing static web site)

from BaseHTTPServer import *
from SimpleHTTPServer import *

httpd = HTTPServer(('', 8000), SimpleHTTPRequestHandler)
httpd.serve_forever()
