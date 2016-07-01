#!/bin/bash 
cd ~
wget http://libmpsse.googlecode.com/files/libmpsse-1.3.tar.gz
tar zxvf libmpsse-1.3.tar.gz
cd libmpsse-1.3/src
./configure --prefix=/usr --disable-python
make
sudo make install
cd /etc/udev/rules.d
sudo wget https://raw.githubusercontent.com/mirakonta/lora_gateway/master/libloragw/99-libftdi.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo adduser pi plugdev
