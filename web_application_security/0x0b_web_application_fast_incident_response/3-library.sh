#!/bin/bash
awk '{print $1, $12}' logs.txt | grep "$(awk '{print $1}' logs.txt | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')" | awk -F'"' '{print $2}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'

