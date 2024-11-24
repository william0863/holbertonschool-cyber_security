#!/bin/bash
grep "iptables"  auth.log | grep "input" | wc -l

