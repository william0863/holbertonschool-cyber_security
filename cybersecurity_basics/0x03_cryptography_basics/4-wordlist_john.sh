#!/bin/bash
john --format=Raw-MD5 --wordlist=/usr/share/wordlist/rockyou.txt "$1"
