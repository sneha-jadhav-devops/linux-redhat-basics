#!/bin/bash

echo "System Health Check"
echo "-------------------"

echo "CPU Load:"
uptime

echo "Memory Usage:"
free -h

echo "Disk Usage:"
df -h
