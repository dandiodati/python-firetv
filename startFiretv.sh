#!/bin/bash

# create the devices.yaml before 
if [ ! -f /config/devices.yaml ]
then
 cat <<EOF > /config/devices.yaml
devices:
  $DEVICE_NAME:
    host: $DEVICE_HOST
EOF
fi
firetv-server -c config/devices.yaml
