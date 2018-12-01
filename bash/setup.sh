#!/bin/bash
#Setup script for the Pi Temporal Camera

today=`date +%Y-%m-%d.%H:%M:%S`

mv etc/motion/motion.conf etc/motion/motion-$today.conf
wget https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/motion/motion.conf
mv motion.conf etc/motion/motion.conf

#command line entry:


