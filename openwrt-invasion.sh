#!/bin/sh

pkg install git wget python3 python-pip inetutils unzip openssh -y
wget -qO openwrt-invasion.zip https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.zip
unzip openwrt-invasion.zip
pip install -r openwrt-invasion/requirements.txt
rm -f openwrt-invasion.zip
