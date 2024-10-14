#!/bin/bash
find "$1" -type f -exec sudo chmod -R o=r "$1" 2>/dev/null
