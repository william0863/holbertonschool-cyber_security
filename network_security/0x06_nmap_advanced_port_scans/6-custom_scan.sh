#!/bin/bash
sudo nmap -sX -p $2 $1 -oN -scanflags > custom_scan.txt >/dev/null 2>&1
