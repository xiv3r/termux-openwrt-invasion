# Download and Install Termux

## 👉 [Termux](https://github.com/termux/termux-app/releases/download/v0.118.1/termux-app_v0.118.1+github-debug_universal.apk)

# Auto Install

```sh
pkg update && pkg upgrade && pkg install curl && curl https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.sh > openwrt-invasion.sh && sh openwrt-invasion.sh
```

# Setup
- Reset the Xiaomi-4C router and configure it with a password of `12345678`
- Connect the lan cable to Xiaomi 4C Router WAN for internet.
- Then connect to the Xiaomi_***** wifi and execute the command below 👇 

```sh
python3 remote_command_execution_vulnerability.py
```

# Stock to Openwrt Transition
- ## Get the root access via `telnet`
```sh
telnet 192.168.31.1
```
- login:`root`
- passwd:`root`

- ## Download the openwrt
```sh
cd /tmp && wget -O openwrt.bin https://downloads.openwrt.org/releases/23.05.5/targets/ramips/mt76x8/openwrt-23.05.5-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```
- ## Flash the Firmware
```sh
mtd -e OS1 -r write /tmp/openwrt.bin OS1
```
