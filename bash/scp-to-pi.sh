#!/bin/bash
#While editing files in my git project, I use this script to
#push the updated files to the Raspberry Pi



#nr-116 is my Piat 192.168.1.116
#it runs Node Red and Motion

today=`date +%Y-%m-%d.%H:%M:%S`


#scp is used to copy files over ssh
#ssh keys need to be set up for this to work without a password
scp pi@192.168.1.106:/etc/motion/* ./


