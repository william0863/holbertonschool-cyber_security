#!/bin/bash
lynis audit system --quiet | grep "Vulnerability"
