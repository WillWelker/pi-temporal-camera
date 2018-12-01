#!/bin/bash
#Setup script for the Pi Temporal Camera

today=`date +%Y-%m-%d.%H:%M:%S`

mv etc/motion/motion.conf etc/motion/motion-$today.conf


