#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Quitting..."
   exit 1
fi

if [ -f /etc/redhat-release ]; then
    yum install -y snapd
    ln -s /var/lib/snapd/snap /snap
elif [ -f /etc/debian_version ]; then
    apt install -y snapd
fi

snap install --classic go


# Users that want lastest via apt
# sudo add-apt-repository ppa:longsleep/golang-backports
# sudo apt-get update
# sudo apt-get install golang-go