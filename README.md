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
- 插件包含：SSRP，PassWall，OpenClash，AdguardHome，网易云解锁，SQM，DNSProxy，网络唤醒，DDNS，UPNP，FullCone(防火墙中开启，默认开启)，流量分载，irq优化，京东签到，Zerotier，FRPC，FRPS，无线打印，流量监控，过滤军刀，R2S-OLED
- ss协议在armv8上实现了aes硬件加速（请**仅使用aead加密**的连接方式）
- 集成并默认启用了UKSM，BBRv2，LRNG，以及CacULE Scheduler
- 如有任何问题，请先尝试ssh进入后台，输入fuck后回车，等待机器重启后确认问题是否已经解决

### 下载

- 选择自己<b>设备对应的固件</b>，并[下载](https://github.com/shawnking07/R2S-R4S-X86-OpenWrt/releases/)

### 鸣谢

|                 [CTCGFW](https://github.com/immortalwrt)                  |              [coolsnowwolf](https://github.com/coolsnowwolf)              |                    [Lienol](https://github.com/Lienol)                    |              [AmadeusGhost](https://github.com/AmadeusGhost)              |
| :-----------------------------------------------------------------------: | :-----------------------------------------------------------------------: | :-----------------------------------------------------------------------: | :-----------------------------------------------------------------------: |
| <img width="60" src="https://avatars.githubusercontent.com/u/53193414"/>  | <img width="60" src="https://avatars.githubusercontent.com/u/31687149" /> | <img width="60" src="https://avatars.githubusercontent.com/u/23146169" /> | <img width="60" src="https://avatars.githubusercontent.com/u/42570690" /> |
|            [NoTengoBattery](https://github.com/NoTengoBattery)            |                    [tty228](https://github.com/tty228)                    |                  [destan19](https://github.com/destan19)                  |                [1715173329](https://github.com/1715173329)                |
| <img width="60" src="https://avatars.githubusercontent.com/u/11285513" /> | <img width="60" src="https://avatars.githubusercontent.com/u/33397881" /> | <img width="60" src="https://avatars.githubusercontent.com/u/3950091" />  | <img width="60" src="https://avatars.githubusercontent.com/u/22235437" /> |
|                 [jerrykuku](https://github.com/jerrykuku)                 |                    [lisaac](https://github.com/lisaac)                    |             [rufengsuixing](https://github.com/rufengsuixing)             |                 [vernesong](https://github.com/vernesong)                 |
| <img width="60" src="https://avatars.githubusercontent.com/u/9485680" />  | <img width="60" src="https://avatars.githubusercontent.com/u/3320969" />  | <img width="60" src="https://avatars.githubusercontent.com/u/22387141" /> | <img width="60" src="https://avatars.githubusercontent.com/u/42875168" /> |
|                     [ElonH](https://github.com/ElonH)                     |                   [NateLol](https://github.com/NateLol)                   |                [garypang13](https://github.com/garypang13)                |              [QiuSimons](https://github.com/QiuSimons/YAOF)               |
| <img width="60" src="https://avatars.githubusercontent.com/u/32666230" /> | <img width="60" src="https://avatars.githubusercontent.com/u/5166306" />  | <img width="60" src="https://avatars.githubusercontent.com/u/48883331" /> | <img width="60" src="https://avatars.githubusercontent.com/u/45143996" /> |


