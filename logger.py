import socket
import time
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

UDP_IP = "udp_balancer"
UDP_PORT = 5140

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

if __name__ == "__main__":
    count = 1
    while True:
        message = f"UDP log message #{count}"
        sock.sendto(message.encode(), (UDP_IP, UDP_PORT))
        logging.info(f"Sent: {message}")
        count += 1
        time.sleep(5)
