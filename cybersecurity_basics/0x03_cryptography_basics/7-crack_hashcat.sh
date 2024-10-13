#!/bin/bash
hashcat -m 0 "$1" /usr/share/wordlist/rockyou.txt
