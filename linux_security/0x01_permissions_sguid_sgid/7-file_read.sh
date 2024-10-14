#!/bin/bash
find "$1" -type f sudo chmod -R o=r "$1" 2>/dev/null
