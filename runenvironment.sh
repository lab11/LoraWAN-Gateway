#!/bin/bash -e
cd ~/LoraWAN-Gateway/exec/
./update_gwid.sh local_conf.json
screen -dmS pf ./lora_pkt_fwd

cd ~/LoraWAN-Gateway/exec/lora-server/
screen -dmS b ./lora-gateway-bridge
screen -dmS s ./startserver.sh

