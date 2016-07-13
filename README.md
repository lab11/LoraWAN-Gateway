# LoraWAN-Gateway
This repository contains code to make a LoraWan gateway. This software runs on a Raspberry Pi with a MTAC-LORA radio from Multi-Tech. It is tested on U.S. bands (915 Mhz).

## Installation
We need the FTDI driver (libmpsse.so). It is platform dependent, so compile it from source. Once finished libmpsse.so should be compiled and copied to /usr/lib. To install FTDI:

    ./ftdiinstall.sh

Now we download and compile the lora_gateway library and then the packet forwarder. Once finished lora_pkt_fwd should be compiled and copied in ~/LoraWAN-Gateway/exec:

    cd ~
    git clone https://github.com/lab11/LoraWAN-Gateway.git
    cd ~/LoraWAN-Gateway
    git submodule init
    git submodule update
    cd ~/LoraWAN-Gateway/lora_gateway
    make clean all
    cd ~/LoraWAN-Gateway/packet_forwarder
    make clean all
    mkdir ~/LoraWAN-Gateway/exec/
    cp ~/LoraWAN-Gateway/packet_forwarder/lora_pkt_fwd/lora_pkt_fwd ~/LoraWAN-Gateway/exec/

The lora_pkt_fwd needs to be configured. Copy the config files and update_gwid. Run update_gwid on local_conf to set the gateway's ID based on MAC address. Make sure to change global_conf.json to work for your radio's frequency:

    cp ~/LoraWAN-Gateway/packet_forwarder/lora_pkt_fwd/global_conf.json ~/LoraWAN-Gateway/exec/
    cp ~/LoraWAN-Gateway/packet_forwarder/lora_pkt_fwd/local_conf.json ~/LoraWAN-Gateway/exec/
    cp ~/LoraWAN-Gateway/packet_forwarder/lora_pkt_fwd/update_gwid.sh ~/LoraWAN-Gateway/exec/
    cd ~/LoraWAN-Gateway/exec/
    ./update_gwid.sh local_conf.json    

Lastly, we need to install some dependencies for the Lora-server software. One of the dependencies is postgresSQL. Create and configure a postgres database following the instructions from https://docs.loraserver.io/loraserver/getting-started/#postgresql-server:
    cd ~/LoraWAN-Gateway/
    ./dependencyinstall.sh

## Usage
To use the gateway software, execute the LoRa packet forwarder:

    cd ~/LoraWAN-Gateway/
    ./runenvironment.sh


## Sources
These instructions were made using the following links:  
    [https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt](https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt)  
    [https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi](https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi)  
    [https://github.com/mirakonta/lora_gateway/wiki/Part-3:-Compile-LoRa-gateway-software](https://github.com/mirakonta/lora_gateway/wiki/Part-3:-Compile-LoRa-gateway-software) 
    [https://docs.loraserver.io/loraserver/](https://docs.loraserver.io/loraserver/)
