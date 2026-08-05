#!/bin/bash

echo "================================="
echo " AWS Linux Operations Toolkit"
echo " System Report"
echo "================================="

echo ""
echo "Hostname: $(hostname)"

echo ""
echo "Kernel:"
uname -r

echo ""
echo "Uptime:"
uptime

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "Logged Users:"
who
