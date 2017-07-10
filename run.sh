#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y screen tmux docker.io
sudo docker build -t espressobin .
[ -d "/opt/openwrt" ] || exec sudo docker run -v /opt/openwrt:/opt:rw --entrypoint /install_sources.sh -it espressobin 
exec screen sudo docker run -v /opt/openwrt:/opt:rw -u openwrt -w /opt/openwrt/openwrt-dd -it espressobin
