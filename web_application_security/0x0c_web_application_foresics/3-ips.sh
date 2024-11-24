#!/bin/bash
cat auth.log | grep "Accepted password for root" | awk '{print $11}' | sort -u | wc -l
