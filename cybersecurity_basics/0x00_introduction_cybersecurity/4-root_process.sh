#!/bin/bash
ps -u $1 -o pid,comm,vsz,rss | grep -v ' 0  0'
