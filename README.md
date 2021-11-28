<p align="center">
<img width="768" src="https://raw.githubusercontent.com/QiuSimons/Others/master/YAOF.png" >
</p>

[![R2S-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R2S-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R2S-OpenWrt.yml)
[![R2C-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R2C-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R2C-OpenWrt.yml)
[![R4S-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R4S-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R4S-OpenWrt.yml)
[![X86-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/X86-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/X86-OpenWrt.yml)


### 特性

- 基于 [QiuSimons - YAOF](https://github.com/QiuSimons/YAOF) 修改的自用固件
- 修复 DDNS 开机不自启动的问题 
- 基于原生 OpenWrt 21.02 编译，默认管理地址 192.168.10.1
- 默认开启了 Software Offload
- 内置升级功能可用，物理 Reset 按键可用
- 预配置了部分插件. OpenClash 用户友好 ( 不建议任何 DNS 套娃 ), 修改了部分插件的启动顺序, 更换了 boostupnp 脚本的 IP 检查器使得规则模式下获取到国内 IP
- 可无脑 opkg kmod
- R2C/R2S核心频率1.6，R4S核心频率2.2/1.8
- O3 编译，CFLAG优化
- 插件包含：PassWall，OpenClash，AdguardHome，网易云解锁，SQM，网络唤醒，DDNS，UPNP，FullCone(防火墙中开启，默认开启)，流量分载，irq优化，Zerotier，FRPC，FRPS，无线打印，流量监控，R2S-OLED
- ss协议在armv8上实现了aes硬件加速（请**仅使用aead加密**的连接方式）
- 集成并默认启用了BBRv2，LRNG
- 如有任何问题，请先尝试ssh进入后台，输入fuck后回车，等待机器重启后确认问题是否已经解决

### 下载

- 选择自己**设备对应的固件**，并[下载](https://github.com/shawnking07/YAOF/releases/)
