#!/bin/bash

echo "===== SYSTEM REPORT ====="
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"
echo "Uptime:"
uptime

echo ""
echo "Memory:"
free -h

echo ""
echo "Disk:"
df -h /
