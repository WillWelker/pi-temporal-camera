#!/bin/bash
# the 'shebang' line above means this file should be executed with the Bash program in the bin directory
# this script fetches your motion.conf file from your pi
# scp is like the cp command (copy) but with ssh
# the ./ means 'here' in the current directory
# of course you will need to change the ip address to your pi's address on the network
# if you set up ssh keys, you won't need to enter a password

# now, wave your magic wand and repeat this command...
scp pi@192.168.43.106:/etc/motion/motion.conf ./

