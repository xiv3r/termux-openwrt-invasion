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
# <h1 align="center"> From Stock to Openwrt </h1>
  
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
- ## 👉 Goto [192.168.1.1](http://192.168.1.1)
<br><br>


# <p align="center"> From Openwrt back to Stock </p>

• Add additional AP mode wifi (disable dhcp) that is connected from the Xiaomi Router.

• Every router reboots kindly disconnect and reconnect to the wifi (refresh dhcp ip)
<br>
## Update & install dependencies
```sh
opkg update && opkg install kmod-mtd-rw wget
```
## Import the breed.bin into `/tmp`
```sh
cd /tmp && wget https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/breed.bin
```
## Allow mtd write permission
```sh
insmod mtd-rw i_want_a_brick=1
```
## Flash the `breed.bin` into the `bootloader`
```sh
mtd -e bootloader -r write /tmp/breed.bin bootloader
```
## Download this 👉 [recovery.bin](https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/recovery.bin)

## Goto the breed dashboard
- 👉 [192.168.1.1](192.168.1.1)
  - upgrade -> programmer mode
- Load the `16MB recovery.bin` Firmware
  - unchecked `skip bootloader`
  - unchecked `skip eeprom`
  - Click `Upgrade`
