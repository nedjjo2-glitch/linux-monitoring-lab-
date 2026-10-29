#!/bin/bash

REPORT="report_$(date +%Y-%m-%d_%H-%M-%S).txt"

{
echo "===== Linux System Monitor ====="
echo " "
echo "Date and Time:"
date
echo " "
echo "Current User:"
whoami
echo " "
echo "Memory Usage"
free -h
echo " "
echo "Disk Usage:"
df -h /
echo " "
echo "Running Processes:"
ps aux --sort=-%cpu | head
} > "$REPORT"
echo " " >> "$REPORT"
echo "== Failed Login Attempts ==" >> "$REPORT"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -n 10 >> "$REPORT"
echo "Report saved to: $REPORT"
