#!/bin/bash

IPTABLES="sudo /usr/sbin/iptables"
IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

EIF="eth0"
WIF="wlan0"

APIF="wifi0"

OUT_APPS="ftp ssh telnet smtp bootps domain finger http nntp https http-alt ntp"

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

#Only accept output of traffic for specific application protocols
for app in ${OUT_APPS}
do
    for entry in `awk '{print $1,$2}' /etc/services | grep "^${app} " | awk '{print $2}'`
    do
        port=`echo $entry |  awk -F\/ '{print $1}'`
        proto=`echo $entry | awk -F\/ '{print $2}'`
        ${IPTABLES} -A OUTPUT -o ${EIF} -p ${proto} --dport ${port} -j ACCEPT
        ${IPTABLES} -A OUTPUT -o ${WIF} -p ${proto} --dport ${port} -j ACCEPT
    done
done

#Accept ICMP out (for ping)
${IPTABLES} -A OUTPUT -o ${EIF} -p icmp -j ACCEPT
${IPTABLES} -A OUTPUT -o ${WIF} -p icmp -j ACCEPT

#Accept related,established traffic back into Ethernet Interface
${IPTABLES} -A INPUT -i ${EIF} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept related,established traffic back into Wireless Interface
${IPTABLES} -A INPUT -i ${WIF} -m state --state RELATED,ESTABLISHED -j ACCEPT
