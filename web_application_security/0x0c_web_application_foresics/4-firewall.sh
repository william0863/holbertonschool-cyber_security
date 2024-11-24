#!/bin/bash
grep "iptables"  auth.log | grep "input" | sort -u | wc -l

