# pi-temporal-camera
Put a time lapse gif image in your Node Red dashboard to watch your plants grow

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/example-gifs/pea-shoots.gif "Example Gif")

This works with a Raspberry Pi camera.  We will be using the raspistill command to take pictures every few minutes.
Then, each day, or when ever you want, a gif will be created with ffmpeg.

### Node Red Setup
Node Red is already installed on your Pi but we need to update it.  Here is the official Node Red page for updating your Pi:
https://nodered.org/docs/hardware/raspberrypi
To use their recomended method, issue this command in you Pi terminal:
```
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
```
We also need Dashboard for Node Red.  You can install it via the Palette Manager in Node Red or
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
For example: 192.168.1.130:1880
And for the Dashboard user interface 192.168.1.130:1880/ui
From your node view, you can now import a flow.  In the node-red directory of this repo, there is a file called
flows_nodered.json.
https://github.com/WillWelker/pi-temporal-camera/blob/master/node-red/flows_nodered.json
You can copy the line of code from this file and import it into Node Red


