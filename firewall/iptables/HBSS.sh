#!/bin/sh

SADDR=`ifconfig eth0 | grep 'inet ' | awk '{print $2}' | awk -F: '{print $2}'`

iptables -t nat -A POSTROUTING -s 128.49.130.0/24 -j SNAT --to-source $SADDR
iptables -t nat -A PREROUTING  -d $SADDR -p tcp --dport 591 -j DNAT --to-destination 128.49.130.142
