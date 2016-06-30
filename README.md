# LoraWAN-Gateway
LoraWAN gateway software

First of all we need the FTDI driver (libmpsse.so). Don't try to find it in internet because it is platform dependent. It is better to compile it from sources. Once finished libmpsse.so should be compiled and copied to /usr/lib:

    sudo apt-get install libftdi-dev --assume-yes
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


Now we can continue with the LoRa gateway: download the sources and compile them. Once finished basic_pkt_fwd should be compiled and copied in ~/LoraWAN-Gateway/exec:

    git clone https://github.com/lab11/LoraWAN-Gateway.git
    cd ~/LoraWAN-Gateway/lora_gateway
    make clean all
    cd ~/LoraWAN-Gateway/packet_forwarder
    make clean all
    cp ~/LoraWAN-Gateway/packet_forwarder/basic_pkt_fwd/basic_pkt_fwd ~/LoraWAN-Gateway/exec/
    cp ~/LoraWAN-Gateway/packet_forwarder/basic_pkt_fwd/*.json ~/LoraWAN-Gateway/exec/
    cd ~/LoraWAN-Gateway/exec


Finally we can execute the LoRa gateway:

    ./basic_pkt_fwd



This tutorial is made using these links:  
[https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt](https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt)  
[https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi](https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi)  
https://github.com/mirakonta/lora_gateway/wiki/Part-3:-Compile-LoRa-gateway-software 
