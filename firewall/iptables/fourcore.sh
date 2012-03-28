#!/bin/bash

IPTABLES="/sbin/iptables"
IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

EIF="eth0"
EADDR=`${IFCONFIG} ${EIF} | grep addr | awk '{print $2}' | awk -F: '{print $2}'`
EMASK="24"
ENET="10.1.100.0"

VM1="vmnet1"
VM1ADDR="10.1.152.1"
VM1MASK="24"
VM1NET="10.1.152.0"

VM8="vmnet8"
VM8ADDR="10.1.151.1"
VM8MASK="24"
VM8NET="10.1.151.0"

#Flush
${IPTABLES} -F
${IPTABLES} -t nat -F

#Set all policys to DROP
${IPTABLES} -P INPUT DROP
${IPTABLES} -P FORWARD DROP
${IPTABLES} -P OUTPUT DROP

${IPTABLES} -t nat -P PREROUTING ACCEPT
${IPTABLES} -t nat -P POSTROUTING ACCEPT
${IPTABLES} -t nat -P OUTPUT ACCEPT

#Accept all input and output on the loopback interface.
${IPTABLES} -A OUTPUT -o ${LO} -s ${LADR} -d ${LADR} -j ACCEPT
${IPTABLES} -A INPUT -i ${LO} -s ${LADR} -d ${LADR} -j ACCEPT

#Accept all traffic in and out of vmnet1 and vmnet8
${IPTABLES} -A OUTPUT -o ${VM1} -s ${VM1ADDR} -d ${VM1NET}/${VM1MASK} -j ACCEPT
${IPTABLES} -A INPUT -i ${VM1} -s ${VM1NET}/${VM1MASK} -d ${VM1ADDR} -j ACCEPT

${IPTABLES} -A OUTPUT -o ${VM8} -s ${VM8ADDR} -d ${VM8NET}/${VM8MASK} -j ACCEPT
${IPTABLES} -A INPUT -i ${VM8} -s ${VM8NET}/${VM8MASK} -d ${VM8ADDR} -j ACCEPT

#Accept outgoing traffic on eth0
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -d ! ${EADDR} -j ACCEPT

#Accept related,established traffic back into eth0
${IPTABLES} -A INPUT -i ${EIF} -s ! ${EADDR} -d ${EADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT
