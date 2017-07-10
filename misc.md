# Hints for things that aren't quite configured post boot

# DNS from DHCPing doesn't get automatically used:
ln -fs /tmp/resolv.conf.auto /etc/resolv.conf

# To install luci, et al (ESPRESSOBin doesn't currently have official pkg builds)
# Edit the stock feeds and comment out *all* feeds
/etc/opkg/distfeeds.conf

# Add package feeds (use the gzipped packages tarball)
/etc/opkg/customfeeds.conf

# Install the web interface and support packages (pulls in deps)

opkg update
opkg install luci-ssl
opkg install luci-app-sqm
reboot

# Ask for password on the usb console 
# *standard caveat about physical access applies*

root@LEDE:/# uci set system.@system[0].ttylogin=1
root@LEDE:/# uci commit
