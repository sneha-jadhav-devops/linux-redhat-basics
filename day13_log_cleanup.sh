#!/bin/bash

LOG_DIR="/var/log"
THRESHOLD=80

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $USAGE -gt $THRESHOLD ]; then
  echo "$(date): Disk usage exceeded $THRESHOLD%" >> /var/log/disk_cleanup.log
  find $LOG_DIR -type f -name "*.log" -mtime +7 -exec rm -f {} \;
fi
