#!/bin/sh

apt install git wget python3 python-pip inetutils unzip openssh -y
wget https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.zip
unzip openwrt-invasion.zip
pip install -r openwrt-invasion/requirements.txt
rm openwrt-invasion.zip
