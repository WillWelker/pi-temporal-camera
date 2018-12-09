#!/bin/bash
# This bash script runs a program called ffmpeg that can change picture, audio and video formats
# ffmpeg is probably already installed on your Raspberry Pi
# We will use it to convert an image sequence to a video then video to animated gif

# make color pallete for gif
ffmpeg -y -i ./vid.avi -vf fps=12,scale=400:-1:flags=lanczos,palettegen palette.png

# make gif from video file using palette.png we just made
ffmpeg -i ./vid.avi -i palette.png -filter_complex "fps=12,scale=400:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif

# remove pallet.png
rm palette.png

# rename gif to unique name so browsers won't show cached version
# note: $1 is a built-in variable that references the first perameter used when this script was invoked
# in this case, the node red exec node passed the msg.payload value into it
# if done manually, we would issue ./make-gif.sh my-picture-name
mv output.gif $1.gif
