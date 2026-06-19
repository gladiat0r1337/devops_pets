#!/bin/bash

echo "Top 5 IP with the most request:"
cat nginx-access.log | awk '{print $1}' | sort | uniq -c | sort -rn |  head -n 5 | awk '{print $2 " - " $1}'
echo "Top 5 most requested paths:"
cat nginx-access.log | awk '$7 ~ /^\// {print $7}' | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1}'
echo "Top 5 response status codes:"
cat nginx-access.log | awk '{print $9}' | grep -E '^[2-5][0-9]{2}$' | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2 " - " $1}'

