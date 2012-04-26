#!/bin/sh

IPTABLES="/sbin/iptables"
IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

IF="venet0"
ADR=`${IFCONFIG} ${IF} | grep 'inet addr' | awk '{print $2}' | awk -F: '{print $2}'`
MSK="255.255.255.255"

#Flush
${IPTABLES} -F
${IPTABLES} -t nat -F

#Set all policys to DROP
${IPTABLES} -P INPUT DROP
${IPTABLES} -P FORWARD DROP
${IPTABLES} -P OUTPUT DROP

#Set nap policys to ACCEPT
${IPTABLES} -t nat -P PREROUTING ACCEPT
${IPTABLES} -t nat -P POSTROUTING ACCEPT
${IPTABLES} -t nat -P OUTPUT ACCEPT

#Accept all input and output on the loopback interface.
${IPTABLES} -A OUTPUT -o ${LO} -s ${LADR} -d ${LADR} -j ACCEPT
${IPTABLES} -A INPUT -i ${LO} -s ${LADR} -d ${LADR} -j ACCEPT

#Accept incomming ssh connections
${IPTABLES} -A INPUT -i ${IF} 
