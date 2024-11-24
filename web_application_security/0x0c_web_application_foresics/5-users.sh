#!/bin/bash
grep -oP '(?<=user=)[^ ]+' auth.log | sort -u | paste -sd,

