#!/bin/bash

# DevOps Service Health Check Script

SERVICE="nginx"

systemctl is-active --quiet $SERVICE

if [ $? -eq 0 ]; then
  echo "$SERVICE is running"
else
  echo "$SERVICE is down. Restarting..."
  systemctl restart $SERVICE
  echo "$SERVICE restarted"
fi
