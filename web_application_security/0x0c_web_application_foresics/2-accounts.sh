#!/bin/bash
awk '/Failed password/ {f[$9]++} /Accepted password/ {s[$9]++} END {for (u in s) if (f[u] && s[u]) print u}' <(tail -n 1000 auth.log)

