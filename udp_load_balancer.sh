#!/bin/bash

# List of syslog servers
DESTINATIONS=("syslog1:5140" "syslog2:5140")
IDX=0

# Listen on UDP port 5140
while true; do
  TARGET="${DESTINATIONS[$IDX]}"
  echo "Forwarding to   $TARGET"

  # Correctly quoted system command
  socat -T1 -u UDP-RECVFROM:5140,fork SYSTEM:"sh -c 'exec socat -u STDIO UDP-SENDTO:$TARGET'"

  # Round-robin logic
  IDX=$(( (IDX + 1) % ${#DESTINATIONS[@]} ))
done
