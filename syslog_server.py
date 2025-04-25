import socket

def run_udp_server(host='0.0.0.0', port=5140):
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
        s.bind((host, port))
        print(f"[Syslog] Listening on {host}:{port}")
        while True:
            data, addr = s.recvfrom(1024)
            print(f"[Syslog] Received from {addr}: {data.decode()}")

if __name__ == "__main__":
    run_udp_server()
