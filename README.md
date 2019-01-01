# pi-temporal-camera
Put a time lapse gif image in your Node Red dashboard to watch your plants grow

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/example-gifs/grass-grow.gif "Example Gif")

Screenshot:
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/Screenshot.png "Screenshot")

Nodes:
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/nodes.png "nodes")

This works with a Raspberry Pi camera.  We will be using the raspistill command to take pictures every few minutes.
Then, each day, or when ever you want, a gif will be created with ffmpeg.

### Node Red Setup
Node Red is already installed on your Pi but we need to update it.  Here is the official Node Red page for updating your Pi:
https://nodered.org/docs/hardware/raspberrypi

To use their recomended method, issue this command in you Pi terminal:
```
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
```
We also need Dashboard for Node Red.  You can install it via the Palette Manager in Node Red, 
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/menu.jpg "Menu")

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/palette.jpg "Palette")

or
cd to your /.node-red/ directory and issue:
```
npm install node-red-dashboard
```

### Static Files
We need to edit settings.js to allow static files like pictures to be served from your pi.  I like to edit files on the pi with Geany.  Right click the file on your pi and select Geany.
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/geany.jpg "Geany")

We need to uncomment the static file entry and correct the path.
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/httpStatic.png "httpStatic")

These static directories do not exist yet.  So in /.node-red/ make a new directory named 'static'.  Then in side /static/ make 'seq', 'img', and 'gif' directories.  Inside the gif directory, make and 'old' directory for old gif files to be stored.  Here is a one-liner that will make all of these directories (only use this for the usual .node-red location on your Pi):

```mkdir -p /home/pi/.node-red/static/gif/old; mkdir /home/pi/.node-red/static/img; mkdir /home/pi/.node-red/static/seq```

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/static-directories.png "directories")

If you want Node Red to run automaticlly at boot, issue:
```
sudo systemctl enable nodered.service
```
You can run ```node-red-start``` or reboot to verify it is running at boot.

Now point your browser to localhost:1880 or from another computer on your network, enter the pi's IP address.
For example: 192.168.1.130:1880.
And for the Dashboard user interface 192.168.1.130:1880/ui.
Varify you have the Dashboard nodes:
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/dash.png "Dashboard Nodes")



From your node view, you can now import a flow.  In the node-red directory of this repo, there is a file called
flows_nodered.json.
https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/node-red/flows_nodered.json
You can copy the code from this file and import it into Node Red from the menu > Import > Clipboard and paste it in.

### Bash Scripts
There is a bash scripts that needs to be placed into your /.node-red/ directory.
https://github.com/WillWelker/pi-temporal-camera/tree/master/bash
You will need make-gif.sh.  As always, read a script carufully before executing it.  This one is fairly simple and well commented.
If you are using the usual path of /home/pi/.node-red/ then no changes need to be made.  But if you have Node Red installed at a different location, you will need to adjust the file paths in the script, exec nodes and template nodes.  Here is a command that will download the bash file and make it executable:

```cd /home/pi/.node-red; wget https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/bash/make-gif.sh; chmod +x make-gif.sh```

### ffmpeg
ffmpeg is a useful program for converting one video format to another.  Also images to video and video to animated gif, which is what we will do.
Install it with:
```sudo apt-get install ffmpeg```

When you read the make-gif.sh, you will see how this program builds gifs from a sequence of images.

### Hardware
Of course you will need your Pi set up with the camera working.  You can test your camera with:
```raspistill -o /home/pi/Desktop/picture.jpg```
This should take a picture and output it to your Pi Desktop.

If you are using a USB cam, raspistill will not work.  You can use a program called Motion to take USB cam pictures at a set interval and save them to the correct dierctory.  The Node Red flow would need to be modified but the bash script could stay the same.



