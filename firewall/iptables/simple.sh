#!/bin/sh

IPTABLES="sudo /usr/sbin/iptables"

LO="lo"
LADR="127.0.0.1"

INTERFACES="eth0 eth1"

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

for intf in $INTERFACES
do
    ${IPTABLES} -A OUTPUT -o $intf -j ACCEPT
    ${IPTABLES} -A INPUT -i $intf -m state --state RELATED,ESTABLISHED -j ACCEPT
done

