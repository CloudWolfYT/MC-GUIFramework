import http.server
import os
import socketserver
import threading
import urllib.parse
import webbrowser

# Adjustable parameters
PORT = 8000
DIRECTORY = "."  # Directory where HTML files are located
DEFAULT_FILE = (
    "index.html"  # Açılmasını istediğiniz varsayılan veya özel dosya adı
)


class Handler(http.server.SimpleHTTPRequestHandler):

  def __init__(self, *args, **kwargs):
    super().__init__(*args, directory=DIRECTORY, **kwargs)

  def translate_path(self, path):
    # Query string / fragment olsa bile kök dizin isteğini yakala
    parsed = urllib.parse.urlsplit(path)
    if parsed.path in ("/", ""):
      path = f"/{DEFAULT_FILE}"
    return super().translate_path(path)


class ReusableTCPServer(socketserver.TCPServer):
  # Port'un "Address already in use" hatasıyla kilitli kalmasını engeller
  allow_reuse_address = True


def open_browser():
  codespace_name = os.environ.get("CODESPACE_NAME")
  github_codespaces_port_forwarding_domain = os.environ.get(
      "GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN"
  )

  if codespace_name and github_codespaces_port_forwarding_domain:
    url = (
        f"https://{codespace_name}-{PORT}.{github_codespaces_port_forwarding_domain}"
    )
  else:
    url = f"http://localhost:{PORT}"

  print(f"\n[INFO] Server started: {url}")
  print(
      "[INFO] HTML review page is opening in a new tab (If it doesn't open,"
      " you can open it from the 'Ports' tab in the bottom panel).\n"
  )

  # Codespaces/headless ortamda webbrowser.open() genelde sessizce başarısız olur,
  # bu normaldir — "Ports" sekmesinden manuel açman gerekir.
  try:
    webbrowser.open(url)
  except Exception:
    pass


def run_server():
  with ReusableTCPServer(("0.0.0.0", PORT), Handler) as httpd:
    threading.Thread(target=open_browser, daemon=True).start()
    try:
      httpd.serve_forever()
    except KeyboardInterrupt:
      print("\n[INFO] Server stopped.")


if __name__ == "__main__":
  run_server()