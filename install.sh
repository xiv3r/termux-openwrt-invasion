#!/bin/sh

pkg install git wget python3 python-pip inetutils unzip -y

wget -O openwrt-invasion.zip https://raw.githubusercontent.com/xiv3r/termux-openwrt-invasion/refs/heads/main/openwrt-invasion.zip

unzip openwrt-invasion.zip

sleep 1s
cd openwrt-invasion
pip install -r requirements.txt && python3 remote_command_execution_vulnerability.py
