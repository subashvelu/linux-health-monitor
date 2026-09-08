#!/bin/bash

echo "================================"
echo "LINUX SYSTEM HEALTH"
echo "================================"

echo "Hostname : $(hostname)"
echo "OS       : $(lsb_release -d | cut -f2)"
echo "Uptime   : $(uptime -p)"

echo ""
echo "---- CPU Usage ----"
top -bn1 | grep "Cpu(s)"

echo ""
echo "---- Memory Usage ----"
free -h

echo ""
echo "---- Disk Usage ----"
df -h /

echo ""
echo "---- Internet Check ----"
if ping -c 1 google.com &> /dev/null
then
    echo "Internet: ONLINE"
else
    echo "Internet: OFFLINE"
fi

echo ""
echo "---- Logged In Users ----"
who

echo "================================"
