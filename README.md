## Download and Install Termux

# 👉 [Termux](https://github.com/termux/termux-app/releases/download/v0.118.1/termux-app_v0.118.1+github-debug_universal.apk)

# Auto Install
- Open termux and paste the command below
```sh
pkg update && pkg upgrade -y && apt install wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.sh | sh && cd openwrt-invasion
```

# Configuration
- Reset the Xiaomi-4C router and configure it with a password of `12345678`.
- Connect the lan cable to Xiaomi 4C Router WAN for internet.
- Then connect to the Xiaomi_***** wifi and execute the command below 👇. 

```sh
python3 remote_command_execution_vulnerability.py
```
# <h1 align="center"> From Stock to Openwrt </h1>
  
- ## Getting the root shell via `telnet`
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
mtd -r write openwrt.bin OS1
```
## 👉 Goto [192.168.1.1](http://192.168.1.1)

# <p align="center"> From Openwrt back to Stock </p>

- ## Getting Openwrt root shell via `SSH`
```sh
ssh root@192.168.1.1
```
- passwd:`your openwrt admin password`


- ## Update & install dependencies
```sh
opkg update && opkg install kmod-mtd-rw wget
```
- ## Import the breed.bin from github into `/tmp`
```sh
cd /tmp && wget https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/breed.bin
```

- ## First Download this 👉 [recovery.bin](https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/recovery.bin)

- ## unlocked mtd write permission
```sh
insmod mtd-rw i_want_a_brick=1
```
- ## Flash the `breed.bin` into the `bootloader`
```sh
mtd -r write /tmp/breed.bin bootloader
```
- ## Goto the breed dashboard
- 👉 [192.168.1.1](192.168.1.1)
  - upgrade -> programmer mode
  - Import the `16MB recovery.bin` Firmware from Download folder
  - check `Automatic restart`
  - unchecked `skip bootloader`
  - unchecked `skip eeprom`
  - click `Upgrade`
<img src="https://github.com/xiv3r/Xiaomi-Mi-Router-4C-CH341A-Flasher/blob/main/src/backup.jpg">
 
 ## Goto 👉 [192.168.31.1](http://192.168.31.1)
