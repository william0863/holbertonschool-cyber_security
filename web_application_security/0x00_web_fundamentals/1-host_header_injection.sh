#!/bin/bash
curl -X POST -H "HOST: $1" -d "$3" "$2"
