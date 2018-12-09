#!/bin/bash
#This bash script runs a program called ffmpeg that can change picture, audio and video formats
#ffmpeg is probably already installed on your Raspberry Pi
#We will use it to convert an image sequence to a video then video to animated gif

mv /home/pi/.node-red/static/seq/*.jpg /home/pi/.node-red/static/img/
rm /home/pi/.node-red/static/img/lastsnap.jpg

ffmpeg -i /home/pi/.node-red/static/img/image-%03d.png /home/pi/.node-red/static/img/video.webm

#make color pallete for gif
ffmpeg -y -i /home/pi/.node-red/static/img/video.webm -vf fps=12,scale=400:-1:flags=lanczos,palettegen /home/pi/.node-red/static/img/palette.png

#make gif from video file using palette.png we just made
ffmpeg -i /home/pi/.node-red/static/img/video.webm -i /home/pi/.node-red/static/img/palette.png -filter_complex "fps=12,scale=400:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif

#remove leftover files
rm /home/pi/.node-red/static/img/palette.png
rm /home/pi/.node-red/static/img/video.webm

#rename gif to unique name so browsers won't show cached version
#note: $1 is a built-in variable that references the first perameter used when this script was invoked
#in this case, the node red exec node passed the msg.payload value into it
#if done manually, we would issue ./make-gif.sh my-picture-name
mv /home/pi/.node-red/static/img/output.gif /home/pi/.node-red/static/gif/$1.gif

