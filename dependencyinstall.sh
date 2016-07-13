#!/bin/bash

#for mosquitto
sudo wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-wheezy.list
sudo apt-get update
sudo apt-get install mosquitto mosquitto-clients
sudo /etc/init.d/mosquitto stop
sudo rm mosquitto-repo.gpg.key

#for postgres
sudo apt-get install postgresql

#for redis
sudo apt-get install redis-server

echo -e "Don't forget to configure postgres"
