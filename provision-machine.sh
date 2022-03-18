#!/bin/bash

sudo apt-get update

sudo apt-get install pip -y

sudo apt-get install ca-certificates curl gnupg lsb-release wget -y

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo pip install --upgrade pip

sudo pip install docker-compose 

d=$(docker --version)
if [[ $? != 0 ]]; then
    echo "Command failed."
elif [[ $d ]]; then
    echo "Docker is installed"
else
    echo "Docker is not installed"
fi

dc=$(docker-compose --version)
if [[ $? != 0 ]]; then
    echo "Command failed."
elif [[ $dc ]]; then
    echo "Docker is installed"
else
    echo "Docker is not installed"
fi
