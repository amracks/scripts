#!/bin/bash

IPTABLES="sudo /usr/sbin/iptables"
#IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

EIF="eth0"
WIF="wlan0"

VIF="vboxnet0"
VADR="192.168.56.1"
VNET="192.168.56.0"
VMASK="24"

#These are looked up in /etc/services
OUT_APPS="ftp-data
          ftp
          ssh
          telnet
          smtp
          bootps
          domain
          finger
          www
          http
          nntp
          https
          http-alt
          ntp
          cvspserver
          imaps
          netbios-ns
          netbios-dgm
          netbios-ssn
          microsoft-ds
          pdl-datastream
	      git
          nntp
          xmpp-client"

#Flush
${IPTABLES} -F
${IPTABLES} -t nat -F

#Set all policys to DROP
${IPTABLES} -P INPUT DROP
${IPTABLES} -P FORWARD DROP
${IPTABLES} -P OUTPUT DROP

#Set nat table policies to accept
${IPTABLES} -t nat -P PREROUTING ACCEPT
${IPTABLES} -t nat -P POSTROUTING ACCEPT
${IPTABLES} -t nat -P OUTPUT ACCEPT

#Accept all input and output on the loopback interface.
${IPTABLES} -A OUTPUT -o ${LO} -s ${LADR} -d ${LADR} -j ACCEPT
${IPTABLES} -A INPUT -i ${LO} -s ${LADR} -d ${LADR} -j ACCEPT

#Accept all input and output on the virtual interface.
${IPTABLES} -A OUTPUT -o ${VIF} -s ${VADR} -d ${VNET}/${VMASK} -j ACCEPT
${IPTABLES} -A INPUT -i ${VIF} -s ${VNET}/${VMASK} -d ${VADR} -j ACCEPT

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

#Accept traceroute traffic out
${IPTABLES} -A OUTPUT -o ${EIF} -p tcp --dport 33434:33654 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -p udp --dport 33434:33654 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${WIF} -p tcp --dport 33434:33654 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${WIF} -p udp --dport 33434:33654 -j ACCEPT

#Google likes to use 465 for outgoing smtp for some reason which is wrong according to /etc/services.
#But, they are Google so there is no stopping them.
#Allow outoing tcp to 465 to smtp.googlemail.com
${IPTABLES} -A OUTPUT -o ${EIF} -p tcp --dport 465 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${WIF} -p tcp --dport 465 -j ACCEPT

#Accept ssh in from 10.1.100.1 (diamondchief) for sshfs from my desktop on a private network.
${IPTABLES} -A INPUT -i ${EIF} -s 10.1.100.1 -d 10.1.100.52 -p tcp --dport 22 -j ACCEPT
#Accept vnc in from 10.1.100.1 (diamondchief) for vnc on private network.
${IPTABLES} -A INPUT -i ${EIF} -s 10.1.100.1 -d 10.1.100.52 -p tcp --dport 5900 -j ACCEPT

#Accept related,established traffic back into Ethernet Interface
${IPTABLES} -A INPUT -i ${EIF} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept related,established traffic back into Wireless Interface
${IPTABLES} -A INPUT -i ${WIF} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept related,established traffic out Ethernet Interface
${IPTABLES} -A OUTPUT -o ${EIF} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept related,established traffic out Wireless Interface
${IPTABLES} -A OUTPUT -o ${WIF} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Optionally, log all other OUTPUT
#${IPTABLES} -A OUTPUT -o ${EIF} -j LOG
#${IPTABLES} -A OUTPUT -o ${WIF} -j LOG

#Optionally, log all other INPUT
#${IPTABLES} -A INPUT -o ${EIF} -j LOG
#${IPTABLES} -A INPUT -o ${WIF} -j LOG
