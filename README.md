# LEDE on ESPRESSOBin (with Cake SQM)

### What? Why? Where?

This is a non-official LEDE distribution compiled for the ESPRESSOBin SBC to take advantage of LEDE+Cake SQM.

The ESPRESSOBin is an SBC (Single Board Computer) with a solid featureset/design that makes it ideal as a tiny fileserver/router/switch.

In this application the ESPRESSOBin sits at the network edge, ensuring that network devices pulling data in or pushing data out to the Internet do so without clogging buffers upstream of itself. 

The net effect is that at high bandwidth usage latency remains mostly stable. 

Cake is a modern queuing discipline that works well in most applications, available in the LEDE distribution that can be installed on the ESPRESSOBin for this use.

More documentation on SQM/bufferbloat:

[Using smart queue management in LEDE](https://lede-project.org/docs/howto/sqm)

[Cake: the latest in sqm (QoS) schedulers](http://burntchrome.blogspot.com/2016/12/cake-latest-in-sqm-qos-schedulers.html) (2016)

[How I Maximized the Speed of My Non-Gigabit Internet Connection](https://medium.com/speedtest-by-ookla/engineer-maximizes-internet-speed-story-c3ec0e86f37a) (Uses codel)

[Introduction to bufferbloat](https://www.bufferbloat.net/projects/bloat/wiki/Introduction/)

# Installation (pre-built releases)

1. Grab the latest [release](https://github.com/davidk/espressobin-lede-sqm-cake/releases).
2. Locate files in the distribution (relevant ones are under bin/targets/mvebu64/generic) 
3. Install it to your SD card with [standard instructions](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card).
4. Insert into your board, power on with 12v and USB console attached
5. screen /dev/ttyUSB0 115200
6. Configure [u-boot](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card) to boot from the SD card.
7. Follow [misc.md](https://raw.githubusercontent.com/davidk/espressobin-lede-sqm-cake/master/misc.md) and [release notes](https://github.com/davidk/espressobin-lede-sqm-cake/releases/tag/0.02) to finish installation.

# Rolling your own release

The builder is intended to be run on a cloud machine with bandwith/CPUs to aid in a reasonable build time. 

The gist is: Drop this on a VM with Debian Jessie and use `run.sh`. After everything is cloned, pulled and built it should drop you into a shell as `openwrt`. 

Add feeds/packages using `./scripts/feeds install $pkgname`. 

Run `make menuconfig` to select how they should be built (`M` modules make .ipkgs). ***Important***: Select options as shown in: http://wiki.espressobin.net/tiki-index.php?page=Build+From+Source+-+OpenWrt (the adavanced options for the kernel tree can be entered up after checking the box with the spacebar).

Save, then run `make -j$yourCoreCount`. Kernel options haven't been updated, so `make -j1 V=s1` and selecting defaults will be needed close to the end (stack a pile of coins on your enter key).

Once it finishes, everything that is supplied in the releases ends up in `bin/`.
