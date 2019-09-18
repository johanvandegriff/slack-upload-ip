#!/bin/bash

PARENT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [[ "$1" == --setup ]]; then
  if [[ ! -f /etc/rc.local ]]; then
    echo "This system does not have /etc/rc.local; find another way to run this script at bootup."
    exit 1
  fi
  SCRIPT="\"$PARENT_DIR/`basename $0`\" &"
  #check if this script is already in /etc/rc.local
  if grep "^${SCRIPT}$" /etc/rc.local; then
    echo "This script is already installed in /etc/rc.local"
  else
    #add this script to /etc/rc.local to run on bootup
    sudo sed -i -e '$i \'"$SCRIPT"'\n' /etc/rc.local
  fi
  exit 0
fi

sleep 10 #wait for it to connect to the wifi
"$PARENT_DIR"/slack-upload-ip.sh
"$PARENT_DIR"/message.sh "`hostname` has booted up with IP: `hostname -I || hostname -i`
on network: `iwgetid -r`"
