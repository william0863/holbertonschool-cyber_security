#!/bin/bash
john --format=NT --wordlist=/usr/share/wordlist/rockyou.txt "$1"; john --show "$1"
