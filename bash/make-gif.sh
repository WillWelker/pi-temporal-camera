#!/bin/bash

./ffmpeg.exe -y -i ./seq/*.mkv \
-vf fps=10,scale=200:-1:flags=lanczos,palettegen palette.png

./ffmpeg.exe -i ./seq/*.mkv -i palette.png -filter_complex \
"fps=10,scale=200:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif