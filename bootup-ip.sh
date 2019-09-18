#!/bin/bash

PARENT_DIR="$(cd "$(dirname "$0")"; pwd -P)"

if [[ "$1" == --setup ]]; then
  if [[ ! -f /etc/rc.local ]]; then
    echo "This system does not have /etc/rc.local; find another way to run this script at bootup."
    exit 1
  fi
  #add this script to /etc/rc.local to run on bootup
  sudo sed -i -e '$i \'"\"$PARENT_DIR/`basename $0`\" &"'\n' /etc/rc.local
  exit 0
fi

sleep 10 #wait for it to connect to the wifi
"$PARENT_DIR"/check.sh
"$PARENT_DIR"/message.sh "`hostname` has booted up with IP: `hostname -I || hostname -i`
on network: `iwgetid -r`"
