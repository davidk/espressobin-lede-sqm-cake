# LEDE + Cake SQM on the ESPRESSOBin switch SBC

1. Grab the latest [release](https://github.com/davidk/espressobin-lede-sqm-cake/releases/tag/0.02).
2. Locate files in the distribution (relevant ones are under bin/targets/mvebu64/generic) 
3. Install it to your SD card with [standard instructions](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card).
4. Insert into your board, power on with 12v and USB console attached
5. screen /dev/ttyUSB0 115200
6. Configure [u-boot](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card) to boot from the SD card.
7. Follow [misc.md](https://raw.githubusercontent.com/davidk/espressobin-lede-sqm-cake/master/misc.md) and [release notes](https://github.com/davidk/espressobin-lede-sqm-cake/releases/tag/0.02) to finish installation.

# Rolling your own

The builder is intended to be run on a cloud machine with bandwith/CPUs to aid in a reasonable build time. 

The gist is: Drop this on a VM with Debian Jessie and use `run.sh`. After everything is cloned, pulled and built it should drop you into a shell as `openwrt`. 

Add feeds/packages using `./scripts/feeds install $pkgname`. 

Run `make menuconfig` to select how they should be built (`M` modules make .ipkgs). 

Save, then run `make -j$yourCoreCount`. Kernel options haven't been updated, so `make -j1 V=s1` and selecting defaults will be needed close to the end (stack a pile of coins on your enter key).

Once it finishes, everything that is supplied in the releases ends up in `bin/`.
