[![R2S-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R2S-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R2S-OpenWrt.yml)
[![R2C-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R2C-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R2C-OpenWrt.yml)
[![R4S-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/R4S-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/R4S-OpenWrt.yml)
[![X86-OpenWrt](https://github.com/shawnking07/YAOF/actions/workflows/X86-OpenWrt.yml/badge.svg)](https://github.com/shawnking07/YAOF/actions/workflows/X86-OpenWrt.yml)


### Features

- Based on [QiuSimons - YAOF](https://github.com/QiuSimons/YAOF)
- Fixed DDNS autoboot issue
- OpenWrt 21.02. Default admin address 192.168.10.1

### Known Issues

- `image with Docker`
  - UDP transfer
  - `WAN` LED will be disabled when stopping docker container (docker uses name of `eth0` as its default network interface, since `eth0` is used as our `WAN` port. change `WAN` LED dev into `pppoe-wan` or your custom network interface instead)


