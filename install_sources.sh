#!/bin/bash

mkdir -p /opt/kernel \
&& cd /opt/kernel

[ -d "/opt/kernel/openwrt-kernel" ] || git clone https://github.com/MarvellEmbeddedProcessors/openwrt-kernel.git -b lede_17.02_release

cd /opt/kernel/openwrt-kernel \
&& git reset --hard HEAD \
&& git config user.email "nobody@example.com" \
&& git config user.name "nobody" \
&& git cherry-pick cc605c7d6399a28e0cf710a09d2a4d9291ddf7ff \
&& mkdir -p /opt/openwrt \
&& cd /opt/openwrt/

[ -d "/opt/openwrt/openwrt-dd" ] || git clone https://github.com/MarvellEmbeddedProcessors/openwrt-dd.git -b lede_17.02_release

cd /opt/openwrt/openwrt-dd/ \
&& ./scripts/feeds update -a \
&& ./scripts/feeds install -d m luci-app-sqm luci-ssl luci kmod-sched-cake \
&& ./scripts/feeds uninstall libevhtp \
&& cd /opt/openwrt/openwrt-dd \
&& chown -R openwrt /opt/ \
&& su openwrt

# broken packages uninstalled above:
# libevhtp - asks for github user/pass interactively (git)

# git cherry-pick cc605c7d6399a28e0cf710a09d2a4d9291ddf7ff
# cc605c7d6399a28e0cf710a09d2a4d9291ddf7ff - adds support for the espressobin switch on the lede branch 
