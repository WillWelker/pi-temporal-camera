#!/bin/bash

# To set up Node Red, run:
# bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
# From the official Node Red Pi page: https://nodered.org/docs/hardware/raspberrypi

# Then run this script with sudo or use sudo as needed for each item below if you do this manually.
systemctl enable nodered.service
# This makes Node Red start autmatically at boot

# Install Motion
apt-get install motion

# make a variable with a timestamp for backup file names
today=`date +%Y-%m-%d.%H:%M:%S`

# make a backup directory for motion.conf
mkdir /etc/motion/motion-backup

# move and rename the existing motion.conf file to the backup directory
mv /etc/motion/motion.conf etc/motion/motion-backup/motion-$today.conf

# get the motion.conf file used in the pi-temporal-camera project
wget https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/motion/motion.conf

# move the downloaded motion.conf file to the proper directory
mv motion.conf /etc/motion/motion.conf


##############################################
# Node Red static directory setup
##############################################

# Set up static directories in /home/pi/.node-red/
# Don't do this unles you ar using pi as a user name
# seq directory for the image sequence to be stored in, -p creates the parent directory of 'static' if needed
# motion needs write permission to this directory
mkdir -p /home/pi/.node-red/static/seq

# img directory for ffmpeg to store gif construction files, video, pallet.png etc
mkdir /home/pi/.node-red/static/img

# gif directory for the final gif to be stored in
mkdir /home/pi/.node-red/static/gif

# Node Red Dashboard install (you can install this with the Pallet Manager if you want
cd /home/pi/.node-re/
npm i node-red-dashboard
