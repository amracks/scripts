#!/bin/sh
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode ad-hoc
sudo iwconfig wlan0 essid FuApple
sudo iwconfig wlan0 key 0192837465afbecd0123456789
sudo dhcpcd wlan0
