#!/bin/bash

mkdir -p /opt/kernel \
&& cd /opt/kernel

[ -d "/opt/kernel/openwrt-kernel" ] || git clone https://github.com/MarvellEmbeddedProcessors/openwrt-kernel.git -b lede_17.02_release

cd /opt/kernel/openwrt-kernel \
&& mkdir -p /opt/openwrt \
&& cd /opt/openwrt/

[ -d "/opt/openwrt/openwrt-dd" ] || git clone https://github.com/MarvellEmbeddedProcessors/openwrt-dd.git -b lede_17.02_release

cd /opt/openwrt/openwrt-dd/ \
&& ./scripts/feeds update -a \
&& ./scripts/feeds install -d m luci-app-sqm luci-ssl luci kmod-sched-cake \
&& ./scripts/feeds uninstall libevhtp \
&& cd /opt/openwrt/openwrt-dd \
&& chown -R openwrt /opt/

# broken packages uninstalled above:
# libevhtp - asks for github user/pass interactively (git)
exit 0
