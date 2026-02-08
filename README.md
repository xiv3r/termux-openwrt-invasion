# Requirements
👉 [Termux](https://github.com/termux/termux-app/releases/download/v0.118.3/termux-app_v0.118.3+github-debug_arm64-v8a.apk)

# Auto Install
```
apt update && pkg upgrade -y && pkg install wget -y && wget -qO openwrt-invasion.sh https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.sh && chmod +x openwrt-invasion.sh && ./openwrt-invasion.sh && cd openwrt-invasion && ls
```

# Configuration
- Reset the Xiaomi-4C router and configure it with a password of `12345678`.
- Connect the lan cable to the Xiaomi Router 4C WAN (for internet).
- Then connect to the Xiaomi_***** wifi SSID and execute the command below 👇. 

```
python remote_command_execution_vulnerability.py
```
- enter the gateway `192.168.31.1`
- enter the password `12345678` and continue entering until it finished.

<img src="https://github.com/xiv3r/termux-openwrt-invasion/blob/main/invasion.png">

# <h1 align="center"> From Stock to Openwrt </h1>
  
- ## Getting the root shell via `telnet`
```
telnet 192.168.31.1
```
- login:`root`
- passwd:`root`

- ## Download the openwrt
```
cd /tmp && wget -O openwrt.bin https://downloads.openwrt.org/releases/25.12.0-rc4/targets/ramips/mt76x8/openwrt-25.12.0-rc4-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```

- ## Flash the Firmware
```
mtd -r write /tmp/openwrt.bin OS1
```

## 👉 Goto [192.168.1.1](http://192.168.1.1)

# <p align="center"> From Openwrt back to Stock </p>

- ## Getting Openwrt root shell via `SSH`
```
ssh root@192.168.1.1
```
- passwd:`your openwrt admin password`


- ## Update & install dependencies
```
opkg update && opkg install kmod-mtd-rw wget
```
- ## Import the breed.bin from github into `/tmp`
```
cd /tmp && wget https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/breed.bin
```

- ## First Download this 👉 [recovery.bin](https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/recovery.bin)

- ## unlocked mtd write permission
```
insmod mtd-rw i_want_a_brick=1
```
- ## Flash the `breed.bin` into the `bootloader`
```
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
