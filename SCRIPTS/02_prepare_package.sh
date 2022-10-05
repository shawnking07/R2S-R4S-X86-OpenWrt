#!/bin/bash
clear

### 基础部分 ###
# 更新 Feeds
./scripts/feeds update -a
./scripts/feeds install -a
# 默认开启 Irqbalance
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config
# 移除 SNAPSHOT 标签
sed -i 's,-SNAPSHOT,,g' include/version.mk
sed -i 's,-SNAPSHOT,,g' package/base-files/image-config.in

### 获取额外的 LuCI 应用、主题和依赖 ###
# Argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/new/luci-theme-argon
wget -P package/new/luci-theme-argon/htdocs/luci-static/argon/background/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/5808303.jpg
rm -rf ./package/new/luci-theme-argon/htdocs/luci-static/argon/background/README.md
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/new/luci-app-argon-config
# Boost 通用即插即用
svn export https://github.com/QiuSimons/slim-wrt/branches/main/slimapps/application/luci-app-boostupnp package/new/luci-app-boostupnp
# 更改为国内 IP 查询
NEW_IP_CHECKER=$'curl --location --request GET \'https://forge.speedtest.cn/api/location/info\' | grep -o \'"full_ip":\s*"[^"]*\' | grep -o \'[^"]*$\''
sed -i "s,curl -s https://api.ipify.org,$NEW_IP_CHECKER," package/new/luci-app-boostupnp/root/usr/sbin/boostupnp.sh
unset NEW_IP_CHECKER

# 动态DNS
sed -i 's/START=95/START=99/g' feeds/packages/net/ddns-scripts/files/etc/init.d/ddns
# fix 自启动
sed -i '/boot()/,+2d' feeds/packages/net/ddns-scripts/files/etc/init.d/ddns
# Docker 容器（会导致 OpenWrt 出现 UDP 转发问题，慎用）
rm -rf ./feeds/luci/applications/luci-app-dockerman
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/collections/luci-lib-docker
svn export https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker feeds/luci/collections/luci-lib-docker
#sed -i 's/+docker/+docker \\\n\t+dockerd/g' ./feeds/luci/applications/luci-app-dockerman/Makefile
sed -i '/sysctl.d/d' feeds/packages/utils/dockerd/Makefile
# DiskMan
mkdir -p package/new/luci-app-diskman && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/new/luci-app-diskman/Makefile
mkdir -p package/new/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/new/parted/Makefile
# IPSec
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ipsec-server package/lean/luci-app-ipsec-server
# IPv6 兼容助手
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper package/lean/ipv6-helper
# MentoHUST
git clone --depth 1 https://github.com/BoringCat/luci-app-mentohust package/new/luci-app-mentohust
git clone --depth 1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk package/new/MentoHUST
# 流量监管
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-netdata package/lean/luci-app-netdata
# OLED 驱动程序
git clone -b master --depth 1 https://github.com/NateLol/luci-app-oled.git package/new/luci-app-oled
# OpenClash
git clone --single-branch --depth 1 -b dev https://github.com/vernesong/OpenClash.git package/new/luci-app-openclash
# 花生壳内网穿透
svn export https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/luci-app-phtunnel package/new/luci-app-phtunnel
svn export https://github.com/teasiu/dragino2/trunk/devices/common/diy/package/teasiu/phtunnel package/new/phtunnel
svn export https://github.com/QiuSimons/dragino2-teasiu/trunk/package/teasiu/luci-app-oray package/new/luci-app-oray
# passwall2
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/new/luci-app-passwall2
wget -P package/new/luci-app-passwall2/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/move_2_services.sh
chmod -R 755 ./package/new/luci-app-passwall2/move_2_services.sh
pushd package/new/luci-app-passwall2
bash move_2_services.sh
popd
pushd package/new/luci-app-passwall2
sed -i 's,default n,default y,g' Makefile
sed -i 's,+v2ray-core ,,g' Makefile
sed -i '/v2ray-plugin/d' Makefile
sed -i '/shadowsocks-libev-ss-redir/d' Makefile
sed -i '/shadowsocks-libev-ss-server/d' Makefile
sed -i '/shadowsocks-libev-ss-local/d' Makefile
popd
# 清理内存
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ramfree package/lean/luci-app-ramfree
# v2raya
git clone --depth 1 https://github.com/zxlhhyccc/luci-app-v2raya.git package/new/luci-app-v2raya
svn export https://github.com/openwrt/packages/trunk/net/v2raya feeds/packages/net/v2raya
ln -sf ../../../feeds/packages/net/v2raya ./package/feeds/packages/v2raya
# socat
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-socat package/new/luci-app-socat
# USB 打印机
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-usb-printer package/lean/luci-app-usb-printer
# UU加速器
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-uugamebooster package/lean/luci-app-uugamebooster
svn export https://github.com/coolsnowwolf/packages/trunk/net/uugamebooster package/lean/uugamebooster
# KMS 激活助手
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-vlmcsd package/lean/luci-app-vlmcsd
svn export https://github.com/coolsnowwolf/packages/trunk/net/vlmcsd package/lean/vlmcsd
# 网络唤醒
svn export https://github.com/zxlhhyccc/bf-package-master/trunk/zxlhhyccc/luci-app-services-wolplus package/new/luci-app-services-wolplus
# 流量监视
git clone -b master --depth 1 https://github.com/brvphoenix/wrtbwmon.git package/new/wrtbwmon
git clone -b master --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/new/luci-app-wrtbwmon
# 迅雷快鸟宽带加速
git clone --depth 1 https://github.com/kiddin9/luci-app-xlnetacc.git package/lean/luci-app-xlnetacc


### 最后的收尾工作 ###
# Lets Fuck
mkdir package/base-files/files/usr/bin
wget -P package/base-files/files/usr/bin/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/fuck
# 最大连接数
sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# default ip address
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 生成默认配置及缓存
rm -rf .config

#exit 0
