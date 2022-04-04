#!/bin/bash

sudo apt-get update

sudo apt-get install pip -y

sudo apt-get install ca-certificates curl gnupg lsb-release wget -y

#install docker
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

#Install docker-compose using pip
sudo pip install --upgrade pip

sudo pip install docker-compose 

d=$(docker --version)
if [[ $? != 0 ]]; then
    echo "Command failed."
elif [[ $d ]]; then
    echo "Docker is installed"
    sudo docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:2.9.3
else
    echo "Docker is not installed"
fi

dc=$(docker-compose --version)
if [[ $? != 0 ]]; then
    echo "Command failed."
elif [[ $dc ]]; then
    echo "Docker Compose is installed"
else
    echo "Docker Compose is not installed"
fi

