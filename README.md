## Download and Install Termux

# 👉 [Termux](https://github.com/termux/termux-app/releases/download/v0.118.1/termux-app_v0.118.1+github-debug_universal.apk)

# Requirements
- Add Access Point (Disable DHCP).
- Xiaomi 4C Router -> Access Point Mode WiFi <- Must connect to the AP and not directly on Xiaomi 4C Router.
- During Transition and Recovery only lan will work, that's why AP is required.

# Auto Install
- Open termux and paste the command below
```sh
termux-setup-storage && pkg update && pkg upgrade && pkg install curl && curl https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.sh | sh && cd openwrt-invasion
```

# Setup
- Reset the Xiaomi-4C router and configure it with a password of `12345678`.
- Connect the lan cable to Xiaomi 4C Router WAN for internet.
- Then connect to the Xiaomi_***** wifi and execute the command below 👇. 

```sh
python3 remote_command_execution_vulnerability.py
```
# <h1 align="center"> From Stock to Openwrt </h1>
  
- ## Getting the root access via `telnet`
```sh
telnet 192.168.31.1
```
- login:`root`
- passwd:`root`

- ## Download the openwrt
```sh
cd /tmp && wget -O openwrt.bin https://downloads.openwrt.org/releases/23.05.5/targets/ramips/mt76x8/openwrt-23.05.5-ramips-mt76x8-xiaomi_mi-router-4c-squashfs-sysupgrade.bin
```

- ## Import using termux Fileserver (stable)
- Download the openwrt firmware 
- Add new termux terminal
```sh
cd ~/storage/downloads && python3 -m http.server -b localhost
```
- Goto 👉 [http://localhost:8000](http://localhost:8000/)
-  Copy the openwrt.bin file
```sh
cd /tmp && wget -O openwrt.bin http://localhost:8000/Downloads/openwrt.bin
```

- ## Flash the Firmware
```sh
mtd -e OS1 -r write /tmp/openwrt.bin OS1
```
# 👉 Goto [192.168.1.1](http://192.168.1.1)

# <p align="center"> From Openwrt back to Stock </p>
## Getting Openwrt root access through SSH
```sh
ssh root@192.168.1.1
```
- passwd:`your openwrt admin password`


## Update & install dependencies
```sh
opkg update && opkg install kmod-mtd-rw wget
```
## Import the breed.bin into `/tmp`
```sh
cd /tmp && wget https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/breed.bin
```

- ## Import using termux Fileserver (stable)
-  Download the breed.bin file
- Add new termux terminal
```sh
cd ~/storage/downloads && python3 -m http.server -b localhost
```
- Goto 👉 [http://localhost:8000](http://localhost:8000/)
-  Copy the openwrt.bin file
```sh
cd /tmp && wget -O breed.bin http://localhost:8000/Downloads/breed.bin
```

## First Download this 👉 [recovery.bin](https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/recovery.bin)

## Allow mtd write permission
```sh
insmod mtd-rw i_want_a_brick=1
```
## Flash the `breed.bin` into the `bootloader`
```sh
mtd -e bootloader -r write /tmp/breed.bin bootloader
```
## Goto the breed dashboard
- 👉 [192.168.1.1](192.168.1.1)
  - upgrade -> programmer mode
- Import the `16MB recovery.bin` Firmware from Download folder
  - check `Automatic restart`
  - unchecked `skip bootloader`
  - unchecked `skip eeprom`
  - click `Upgrade`
 
 # Goto 👉 [192.168.31.1](http://192.168.31.1)
