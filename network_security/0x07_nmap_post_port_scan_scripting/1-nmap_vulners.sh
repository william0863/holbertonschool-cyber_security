#!/bin/bash
nmap -p 80,443 --script vulners -sV $1
