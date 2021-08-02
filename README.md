<p align="center">
<img width="768" src="https://raw.githubusercontent.com/QiuSimons/Others/master/YAOF.png" >
</p>

[![R2S-OpenWrt](https://github.com/shawnking07/R2S-R4S-X86-OpenWrt/actions/workflows/R2S-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/R2S-R4S-X86-OpenWrt/actions/workflows/R2S-OpenWrt.yml)


<h1 align="center">请勿用于商业用途!!!</h1>



### 特性

- 自用固件
- 基于原生 OpenWrt 21.02 编译，默认管理地址192.168.10.1
- 同时支持 SFE/Software Offload （选则其一开启，<b>默认开启SFE</b>）
- 内置升级功能可用，物理 Reset 按键可用
<!-- - 预配置了部分插件（包括但不限于 DNS 套娃，<b>(注意，6月29日开始取消了dns套娃，使用dnsfilter作为广告过滤手段，使用dnsproxy作为dns分流措施，海外端口5335，国内端口6050。)</b> -->
- 正式 Release 版本将具有可无脑 opkg kmod 的特性
- R2S核心频率1.6（**未**交换LAN WAN），R4S核心频率2.2/1.8（建议使用5v4a电源，死机大多数情况下，都是因为<b>你用的电源过于垃圾</b>，另外，你也可以选择使用<b>自带的app限制最大频率</b>，茄子🍆）
- O3 编译
- 插件包含：uu加速器，SSRP，PassWall，OpenClash，AdguardHome，微信推送，网易云解锁，SQM，<del>SmartDNS</del>，<del>ChinaDNS</del>，网络唤醒，DDNS，<del>迅雷快鸟</del>，UPNP，FullCone(防火墙中开启，默认开启)，流量分载，SFE流量分载，irq优化，京东签到，Zerotier，FRPC，FRPS，无线打印，流量监控，过滤军刀，R2S-OLED
- ss协议在armv8上实现了aes硬件加速（请<b>仅使用aead加密</b>的连接方式）
- 如有任何问题，请先尝试ssh进入后台，输入fuck后回车，等待机器重启后确认问题是否已经解决

### 下载

- 选择自己<b>设备对应的固件</b>，并[下载](https://github.com/shawnking07/R2S-R4S-X86-OpenWrt/releases/)

### 截图


### 鸣谢

|          [CTCGFW](https://github.com/immortalwrt)           |           [coolsnowwolf](https://github.com/coolsnowwolf)            |              [Lienol](https://github.com/Lienol)               |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img width="60" src="https://avatars.githubusercontent.com/u/53193414"/> | <img width="60" src="https://avatars.githubusercontent.com/u/31687149" /> | <img width="60" src="https://avatars.githubusercontent.com/u/23146169" /> |
|              [NoTengoBattery](https://github.com/NoTengoBattery)               |              [tty228](https://github.com/tty228)               |              [destan19](https://github.com/destan19)               |
| <img width="60" src="https://avatars.githubusercontent.com/u/11285513" /> | <img width="60" src="https://avatars.githubusercontent.com/u/33397881" /> | <img width="60" src="https://avatars.githubusercontent.com/u/3950091" /> |
|              [jerrykuku](https://github.com/jerrykuku)               |              [lisaac](https://github.com/lisaac)               |              [rufengsuixing](https://github.com/rufengsuixing)               |
| <img width="60" src="https://avatars.githubusercontent.com/u/9485680" /> | <img width="60" src="https://avatars.githubusercontent.com/u/3320969" /> | <img width="60" src="https://avatars.githubusercontent.com/u/22387141" /> |
|              [ElonH](https://github.com/ElonH)               |              [NateLol](https://github.com/NateLol)               |              [garypang13](https://github.com/garypang13)               |
| <img width="60" src="https://avatars.githubusercontent.com/u/32666230" /> | <img width="60" src="https://avatars.githubusercontent.com/u/5166306" /> | <img width="60" src="https://avatars.githubusercontent.com/u/48883331" /> |
|              [AmadeusGhost](https://github.com/AmadeusGhost)               |              [1715173329](https://github.com/1715173329)               |              [vernesong](https://github.com/vernesong)               |
| <img width="60" src="https://avatars.githubusercontent.com/u/42570690" /> | <img width="60" src="https://avatars.githubusercontent.com/u/22235437" /> | <img width="60" src="https://avatars.githubusercontent.com/u/42875168" /> |
