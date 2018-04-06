#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Quitting..."
   exit 1
fi

if [ -f /etc/redhat-release ]; then
    yum install -y python-pip python3-pip
    ln -s /var/lib/snapd/snap /snap
elif [ -f /etc/debian_version ]; then
    apt install python-pip python3-pip
fi