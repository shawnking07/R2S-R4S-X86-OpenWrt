#!/bin/bash
clear

### 基础部分 ###
# 更新 Feeds
./scripts/feeds update -a
./scripts/feeds install -a
# 默认开启 Irqbalance
sed -i "s/enabled '0'/enabled '1'/g" feeds/packages/utils/irqbalance/files/irqbalance.config

### 获取额外的 LuCI 应用、主题和依赖 ###
# 广告过滤 AdGuard
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/new/luci-app-adguardhome
# rm -rf ./feeds/packages/net/adguardhome
# cp -rf ../openwrt_pkg_ma/net/adguardhome ./feeds/packages/net/adguardhome
# sed -i '/init/d' feeds/packages/net/adguardhome/Makefile
# Argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/new/luci-theme-argon
wget -P package/new/luci-theme-argon/htdocs/luci-static/argon/background/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/5808303.jpg
rm -rf ./package/new/luci-theme-argon/htdocs/luci-static/argon/background/README.md
git clone -b master --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/new/luci-app-argon-config
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
# MentoHUST
git clone --depth 1 https://github.com/BoringCat/luci-app-mentohust package/new/luci-app-mentohust
git clone --depth 1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk package/new/MentoHUST
# OLED 驱动程序
git clone -b master --depth 1 https://github.com/NateLol/luci-app-oled.git package/new/luci-app-oled
# OpenClash
git clone --single-branch --depth 1 -b dev https://github.com/vernesong/OpenClash.git package/new/luci-app-openclash
# passwall2
git clone --single-branch --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages.git package/new/openwrt-passwall-packages
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/new/luci-app-passwall2
wget -P package/new/luci-app-passwall2/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/move_2_services.sh
chmod -R 755 ./package/new/luci-app-passwall2/move_2_services.sh
pushd package/new/luci-app-passwall2
bash move_2_services.sh
popd
pushd package/new/luci-app-passwall2
sed -i 's,default n,default y,g' Makefile
popd
# update Golang version
sed -i 's/GO_VERSION_MAJOR_MINOR:=.*/GO_VERSION_MAJOR_MINOR:=1.21/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/GO_VERSION_PATCH:=.*/GO_VERSION_PATCH:=3/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=186f2b6f8c8b704e696821b09ab2041a5c1ee13dcbc3156a13adcf75931ee488/g' feeds/packages/lang/golang/golang/Makefile
# 网络唤醒
svn export https://github.com/zxlhhyccc/bf-package-master/trunk/zxlhhyccc/luci-app-services-wolplus package/new/luci-app-services-wolplus
# 流量监视
git clone -b master --depth 1 https://github.com/brvphoenix/wrtbwmon.git package/new/wrtbwmon
git clone -b master --depth 1 https://github.com/brvphoenix/luci-app-wrtbwmon.git package/new/luci-app-wrtbwmon
# 迅雷快鸟宽带加速
git clone --depth 1 https://github.com/kiddin9/luci-app-xlnetacc.git package/lean/luci-app-xlnetacc
# airsane
git clone --depth 1 https://github.com/shawnking07/AirSane-openwrt.git package/new/airsane
# daed
git clone https://github.com/QiuSimons/luci-app-daed package/new/luci-app-dae
echo '
define KernelPackage/xdp-sockets-diag
  SUBMENU:=$(NETWORK_SUPPORT_MENU)
  TITLE:=PF_XDP sockets monitoring interface support for ss utility
  KCONFIG:= \
	CONFIG_XDP_SOCKETS=y \
	CONFIG_XDP_SOCKETS_DIAG
  FILES:=$(LINUX_DIR)/net/xdp/xsk_diag.ko
  AUTOLOAD:=$(call AutoLoad,31,xsk_diag)
endef

define KernelPackage/xdp-sockets-diag/description
 Support for PF_XDP sockets monitoring interface used by the ss tool
endef

$(eval $(call KernelPackage,xdp-sockets-diag))
' >> package/kernel/linux/modules/netsupport.mk

### 最后的收尾工作 ###
# Lets Fuck
mkdir package/base-files/files/usr/bin
wget -P package/base-files/files/usr/bin/ https://github.com/QiuSimons/OpenWrt-Add/raw/master/fuck
# 最大连接数
sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# default ip address
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# cups config
sed -i 's/192.168.1.1/192.168.10.1/g' feeds/packages/utils/cups/files/etc/cups/cupsd.conf

# 生成默认配置及缓存
rm -rf .config

#exit 0
