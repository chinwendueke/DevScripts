#! /bin/bash

#Description: Script to install Docker on Linux, This is compatible with Fedora and Debian Family
#Author: eviofekeze
#Date: Nov 4

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

if [ $? -ne 0 ]
then
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	sudo apt-get update -y
fi

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
