#!/bin/bash

# 在 X86 架构下移除 Shadowsocks-rust
sed -i '/Rust_Client:/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/Rust_Server:/d' package/lean/luci-app-ssr-plus/Makefile
sed -i '/Rust_Client:/d' package/new/luci-app-passwall/Makefile
sed -i '/Rust_Server:/d' package/new/luci-app-passwall/Makefile
#sed -i '/Rust:/d' package/lean/luci-app-vssr/Makefile

# 内核加解密组件
echo '
CONFIG_CRYPTO_AES_NI_INTEL=y
' >>./target/linux/x86/64/config-5.4

# 预配置一些插件
cp -rf ../PATCH/files ./files

chmod -R 755 ./
find ./ -name *.orig | xargs rm -f
find ./ -name *.rej | xargs rm -f

exit 0
