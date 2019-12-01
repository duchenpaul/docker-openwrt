#!/bin/bash
#=================================================
#   Description: DIY script
#   Lisence: MIT
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

ls -l
# wndr4300
sed -i s/'23552k(ubi),25600k@0x6c0000(firmware)'/'120832k(ubi),122880k@0x6c0000(firmware)'/ target/linux/ar71xx/image/legacy.mk

cat target/linux/ar71xx/image/legacy.mk | grep wndr4300_mtdlayout

# Enable wifi
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh


git clone -b master --single-branch https://github.com/LGA1150/openwrt-fullconenat package/fullconenat
# fullconenat patch
mkdir package/network/config/firewall/patches
wget -P openwrt/package/network/config/firewall/patches/ https://raw.githubusercontent.com/LGA1150/fullconenat-fw3-patch/master/fullconenat.patch
# Patch LuCI
cd feeds/luci && wget -O- https://raw.githubusercontent.com/LGA1150/fullconenat-fw3-patch/master/luci.patch | git apply

echo 'src-git rosy https://github.com/rosywrt/luci.git' >> feeds.conf.default