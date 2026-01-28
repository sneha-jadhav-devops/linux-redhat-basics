#!/bin/bash

SERVICE=$1
LOGFILE="/var/log/service_monitor.log"

if [ -z "$SERVICE" ]; then
  echo "Usage: $0 <service-name>"
  exit 1
fi

systemctl is-active --quiet $SERVICE

if [ $? -eq 0 ]; then
  echo "$(date) : $SERVICE is running" >> $LOGFILE
else
  echo "$(date) : $SERVICE is DOWN. Restarting..." >> $LOGFILE
  systemctl restart $SERVICE

  if [ $? -eq 0 ]; then
    echo "$(date) : $SERVICE restarted successfully" >> $LOGFILE
  else
    echo "$(date) : Failed to restart $SERVICE" >> $LOGFILE
  fi
fi
