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

mkdir -p /config/keysx
mkdir -p  /root/.android
export ANDROID_VENDOR_KEYS="/config/keys"
echo $ANDROID_VENDOR_KEYS

if [ -e /config/keys/adbkey ]
then
cp -f /config/keys/* /root/.android
fi
 
#adb start-server
#cp -f /root/.android/* /config/keys


firetv-server -c '/config/devices.yaml'
