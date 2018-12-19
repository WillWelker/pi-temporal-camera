# pi-temporal-camera
Put a time lapse gif image in your Node Red dashboard to watch your plants grow

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/example-gifs/pea-shoots.gif "Example Gif")

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

If you want Node Red to run automaticlly at boot, issue:
```
sudo systemctl enable nodered.service
```
You can run ```node-red-start``` or reboot to verify it is running at boot.

Now point your browser to localhost:1880 or from another computer on your network, enter the pi's IP address.
For example: 192.168.1.130:1880.
And for the Dashboard user interface 192.168.1.130:1880/ui.

### Staic Files
We need to edit settings.js to allow static files like pictures to be served from your pi.  We will also enable persistant storage.  I like to edit files on the pi with Geany.  Right click the file on your pi and select Geany.
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/geany.jpg "Geany")

We need to uncomment the static file entry and correct the path.
![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/httpStatic.png "httpStatic")

These static directories do not exist yet.  So in /.node-red/ make a new directory named 'static'.  Then in side /static/ make 'seq', 'img', and 'gif' directories.

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/static-directories.png "directories")

Then we will uncomment the entry for context data storage.

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/images/contextStorage.png "ContextStorage")



From your node view, you can now import a flow.  In the node-red directory of this repo, there is a file called
flows_nodered.json.
https://github.com/WillWelker/pi-temporal-camera/blob/master/node-red/flows_nodered.json
You can copy the line of code from this file and import it into Node Red.

### Bash Scripts
There are two bash scripts that need tp be placed into your /.node-red/ directory.
https://github.com/WillWelker/pi-temporal-camera/tree/master/bash
We need count-images.sh and make-gif.sh.  As always, read a script carufully before executing it.  These are fairly simple and well commented.
If you are using the usual path of /home/pi/.node-red/ then no changes need to be made.  But if you have it installed at a different location, you will need to adjust the file paths in the scripts, exec nodes and template nodes.

### ffmpeg
ffmpeg is a useful program for converting one video format to another.  Also images to video and video to animated gif.  Which is what we will do.
Install it with:
```sudo apt-get install ffmpeg```

When you read the make-gif.sh, you will see how this program builds gifs from a sequence of images.
As it happens, you can use this script to convert any sequence of images to a gif.



