#!/bin/bash
john --format=Raw-sha256 --wordlist=/usr/share/wordlist/rockyou.txt "$1"
