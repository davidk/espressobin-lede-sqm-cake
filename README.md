# LEDE + Cake SQM on the ESPRESSOBin switch SBC

1. Grab the latest [release](https://github.com/davidk/espressobin-lede-sqm-cake/releases/tag/0.01).
2. Locate files in the distribution (relevant ones are under bin/targets/mvebu64/generic) 
3. Install it to your SD card with [standard instructions](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card).
4. Insert into your board, power on with 12v and USB console attached
5. screen /dev/ttyUSB0 115200
6. Configure [u-boot](http://wiki.espressobin.net/tiki-index.php?page=Boot+from+removable+storage+-+OpenWrt#Using_MicroSD_card) to boot from the SD card.
7. Follow [misc.txt](https://raw.githubusercontent.com/davidk/espressobin-lede-sqm-cake/master/misc.txt) and [release notes](https://github.com/davidk/espressobin-lede-sqm-cake/releases/tag/0.01) to finish installation.
