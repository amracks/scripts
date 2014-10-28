#!/bin/sh
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode managed
sudo iwconfig wlan0 essid any
sudo iwconfig wlan0 key off
