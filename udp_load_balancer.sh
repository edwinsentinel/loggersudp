#!/bin/bash

# List of syslog servers
DESTINATIONS=("syslog1:5140" "syslog2:5140")
IDX=0

# Listen on UDP port 5140
while true; do
  echo "Waiting for log on UDP 5140..."
  socat -T1 -u UDP-RECVFROM:5140,fork SYSTEM:"socat -u STDIO UDP-SENDTO:${DESTINATIONS[$IDX]}"
  IDX=$(( (IDX + 1) % ${#DESTINATIONS[@]} ))
done
