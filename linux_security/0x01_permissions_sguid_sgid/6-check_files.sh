#!/bin/bash
find "$1" -type f \( -perm /6000 \) -mtime -1 -ls 2>/dev/null
