#!/bin/sh

# create the devices.yaml before 
if [ ! -f /config/devices.yaml ]
then

 cat <<EOF > /config/devices.yaml 
devices:  
  ${DEVICE_NAME:-undefined_device_name}: 
    host: ${DEVICE_HOST:-undefined_host} 
EOF
fi

if [ -f /config/keys ]
then

mkdir /root/.android;
cp -f /config/keys/* .android;
fi

adb start-server
mkdir /config/keys;
cp -f /root/.android/* /config/keys;

firetv-server -c '/config/devices.yaml'
