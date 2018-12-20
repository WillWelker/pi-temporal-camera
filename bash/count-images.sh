#!/bin/bash

#count the number of images that have been stored by Motion snapshot

img=0

# for loop to iterate through images and count them
for i in /home/pi/.node-red/static/seq/*.jpg; do
  
  let img=img+1
done

#output img back to Node Red

echo $img
