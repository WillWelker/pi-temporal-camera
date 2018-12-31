#!/bin/bash

# When adjusting code on my pi,
# I use this script to scp (ssh copy)
# my bash scripts to my git repo directory.
# With ssh keys enable, no password is needed.

# Note: ./ inicates the current working directory. 
# You can copy/paste or execute the bash script.

scp pi@192.168.1.130:/home/pi/.node-red/make-gif.sh ./