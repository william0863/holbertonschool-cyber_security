#!/bin/bash
sudo nmap -sX -p $2 $1 -scanflags > custom_scan.txt 2>&1
