#!/bin/bash
find "$1" -perm -exec /4000 ls -l 2>/dev/null
