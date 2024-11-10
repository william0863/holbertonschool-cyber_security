#!/bin/bash
for port in {20..25}; do hping3 -S -p $port -c 1 $1; done
