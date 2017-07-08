# Docker-based builder for ESPRESSOBin LEDE (+ packages)
#
# To use this dockerfile, run the following
#
# docker build -t espressobin .
# docker run -v /opt/openwrt:/opt:rw -it espressobin
# /install_sources.sh
# cd /opt/openwrt/openwrt-dd/
# make defconfig
# make menuconfig
#
# Then follow these instructions:
# http://wiki.espressobin.net/tiki-index.php?page=Build+From+Source+-+OpenWrt
# (Options repeated here for posterity)
# Target System --->
#    Marvell 64b Boards
# Target Profile --->
#    ESPRESSObin (Marvell Armada 3700 Community Board)
# Target Images  --->
#    [x] ramdisk  --->
#    * Root filesystem archives *
#    [x] tar.gz
#    * Root filesystem images *
#    [x] ext4  --->
# [x] Advanced configuration options (for developers)  --->
#    (/opt/kernel/openwrt-kernel) Use external kernel tree
#
# Build everything with:
# su openwrt
# IGNORE_ERRORS=1 make -j$(($(nproc)+1))
#
# The compilation will finish by putting things in $PWD/bin. Host the packages directory on a webserver somewhere and point /etc/opkg/customfeeds.conf to it.
#
# See http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt for more details on how to boot with OpenWRT/LEDE out of U-boot.
#
# For more information on the build system:
# https://wiki.openwrt.org/doc/howto/build

FROM debian:jessie

RUN apt-get update && apt-get upgrade -y \
&& apt-get install build-essential git libncurses5-dev zlib1g-dev unzip wget python subversion gawk libssl-dev file -y

ADD install_sources.sh /

RUN chmod +x /install_sources.sh

RUN useradd openwrt

ENTRYPOINT /bin/bash
