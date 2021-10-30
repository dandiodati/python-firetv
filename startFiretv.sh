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

firetv-server -c '/config/devices.yaml'
