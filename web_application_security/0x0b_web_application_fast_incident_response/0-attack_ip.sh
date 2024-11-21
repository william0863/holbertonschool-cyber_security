#!/bin/bash

if [ "$#" -ne 1 ]; then
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    exit 1
fi

MOST_FREQUENT_IP=$(awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

echo "$MOST_FREQUENT_IP"

