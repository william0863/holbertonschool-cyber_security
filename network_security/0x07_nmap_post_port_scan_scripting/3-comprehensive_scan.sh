#!/bin/bash
nmap -oN comprehensive_scan_results.txt --script=http-vuln-cve2017-5638,ssl-enum-ciphers,ftp-anon $1
