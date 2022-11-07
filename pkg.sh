#! /bin/bash

#Description: Script to install some basic pakages Linux, This is compatible with Ubuntu, Alpine and CentOS Family
#Author: eviofekeze
#Date: Nov 6

echo "Identifying Operating System"
DISTRO=$(. /etc/os-release && echo "$ID")
UBT='ubuntu'
COS='centos'
#RHEL='(Fedora)|(Red Hat.*)'
ALP='alpine'

if [[ "$DISTRO" == "$UBT" ]]
then
        echo "Ubuntu Detected"
	#Remove docker
	sudo apt-get install -y git vim net-tools sysstat zip wget curl

elif [[ "$DISTRO" =~ "$COS" ]]
then
        echo " OS: $DISTRO Detected"
	sudo yum install -y git vim net-tools sysstat zip wget curl
elif [[ "$DISTRO" =~ "$ALP" ]]
then
        echo " OS: $DISTRO Detected"
	sudo apk add -y -y git vim net-tools sysstat zip wget curl
else
        echo "Not compatible with operating system"
fi
