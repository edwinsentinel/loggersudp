# 🔁 Dockerized UDP Log Forwarding System

This project implements a containerized log forwarding system using UDP and a round-robin load balancer. It was built as part of a technical challenge and refined afterward to be more reliable and production-ready.

---

## 📦 Components

- **Logger**: A Python app that generates and sends log messages over UDP.
- **UDP Load Balancer**: A `socat`-based round-robin forwarder that distributes incoming UDP logs to two syslog servers.
- **Syslog Servers**: Two minimal Python-based UDP servers that receive and print incoming log messages.

---

## 🐳 Dockerized Setup

Each component runs as a separate container using `docker-compose`. The entire system is designed for easy testing, scaling, and debugging.

logger ──▶ udp_balancer ──▶ syslog1 └──▶ syslog2


---

## 🚀 How to Run

> **Prerequisites:** Docker + Docker Compose

```bash
# Clone the repo
git clone https://github.com/edwinsentinel/loggersudp.git
cd udploggers

# Start the system
docker-compose up --build
