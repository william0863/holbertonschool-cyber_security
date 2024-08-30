#!/bin/bash
curl -H "Host: $1" -X POST $2 --data $3
