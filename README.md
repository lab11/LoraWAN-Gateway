# LoraWAN-Gateway
LoraWAN gateway software

First of all we need the FTDI driver (libmpsse.so). Don't try to find it in internet because it is platform dependent. It is better to compile it from sources. Once finished libmpsse.so should be compiled and copied to /usr/lib. To install FTDI:

    ./ftdiinstall.sh

Now we can continue with the LoRa gateway: download the sources and compile them. Once finished basic_pkt_fwd should be compiled and copied in ~/LoraWAN-Gateway/exec:

    git clone https://github.com/lab11/LoraWAN-Gateway.git
    cd ~/LoraWAN-Gateway/lora_gateway
    make clean all
    cd ~/LoraWAN-Gateway/packet_forwarder
    make clean all
    cp ~/LoraWAN-Gateway/packet_forwarder/basic_pkt_fwd/basic_pkt_fwd ~/LoraWAN-Gateway/exec/

The basic_pkt_fwd needs to be configured. Copy either the US or EU version and rename it 'global_conf.json':

    cp ~/LoraWAN-Gateway/packet_forwarder/basic_pkt_fwd/global_conf.json.US ~/LoraWAN-Gateway/exec/global_conf.json
    
	OR

    cp ~/LoraWAN-Gateway/packet_forwarder/basic_pkt_fwd/global_conf.json.EU ~/LoraWAN-Gateway/exec/global_conf.json

Finally we can execute the LoRa gateway:

    cd ~/LoraWAN-Gateway/exec
    ./basic_pkt_fwd



This tutorial is made using these links:  
[https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt](https://github.com/Lora-net/lora_gateway/blob/master/libloragw/install_ftdi.txt)  
[https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi](https://github.com/Lora-net/packet_forwarder/wiki/Work-with-Raspberry-Pi)  
https://github.com/mirakonta/lora_gateway/wiki/Part-3:-Compile-LoRa-gateway-software 
