#!/bin/bash

source /etc/os-release
echo "==============="
echo "===OS Version=="
echo "==============="
echo "$PRETTY_NAME"

echo "==============="
echo "===Total RAM==="
echo "==============="
free -h | grep 'Mem:' |  awk '{print $2}'

echo "=============="
echo "===RAM used==="
echo "=============="
free -h | grep 'Mem:' | awk '{print $3}'

echo "==================="
echo "===Available RAM==="
echo "==================="
free -h |grep 'Mem:' | awk '{print $NF}'

echo "==========================================================="
echo "===Total Memory/Used Memory/Avail Memory/Percentage Used==="
echo "==========================================================="
df -h / | awk '{print $2, "	", $3, "	", $4, "	", $5}' | tail -n 1

echo "==============="
echo "===CPU Usage==="
echo "==============="
top -b -n 2 | grep '%Cpu(s)' | tail -n 1 | awk '{print 100 - $8, "%"}'

echo "======================="
echo "===Top 5 CPU Loaders==="
echo "======================="
ps -eo user,pid,%cpu --sort=-%cpu | head -n 6

echo "======================="
echo "===Top 5 RAM Loaders==="
echo "======================="
ps -eo user,pid,%mem --sort=-%mem | head -n 6


