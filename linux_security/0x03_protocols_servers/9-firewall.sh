#!/bin/bash
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport ssh 22 -j ACCEPT && iptables -A INPUT -m state --state RELATED,ESTABLISHED -j DROP ACCEPT
