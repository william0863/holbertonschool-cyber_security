#!/bin/bash
grep "Accepted password" auth.log | awk '{print $9}' | grep -vE '^(root|invalid|app|backup|bin|daemon|dhcp|games|gnats|irc|klog|libuuid|list|lp|mail|man|news|nobody|ntp|proxy|sync|sys|syslog|uucp|www-data|single|sftp)$' | sort -u | paste -sd,

