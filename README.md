# pi-temporal-camera
Put a time lapse gif image in your Node Red dashboard to watch your plants grow

![alt text](https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/example-gifs/cat.gif "Example Gif")

### Node Red Setup
Node Red is already installed on your Pi but we need to update it.  Here is the official Node Red page for updating your Pi:
https://nodered.org/docs/hardware/raspberrypi "Node Red"
To use their recomended method, issue this command in you Pi terminal:
```
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
```
We also need Dashboard for Node Red.  You can install it via the Palette Manager in Node Red or:
```
npm install node-red-dashboard
```
### Motion Setup
Install Motion.
```
sudo apt-get install motion
```
Once motion is installed there are a couple files to configure.  You can backup the exisitning motion.conf file and download a file I have already set up with this command line entry (the -n option prevents overwriting an existing backup):
```
sudo mv -n /etc/motion/motion.conf /etc/motion/motion-backup.conf; wget https://raw.githubusercontent.com/WillWelker/pi-temporal-camera/master/motion/motion.conf; sudo mv motion.conf /etc/motion/motion.conf
```

For more info about setting up Motion on you Pi: https://www.youtube.com/watch?v=AejagSlRHQU "Motion Video"


