#!/bin/bash

IPTABLES="/sbin/iptables"

LO="lo"
LADR="127.0.0.1"

IIF="eth1"
IADR="10.1.100.1"
IMASK="24"
INET="10.1.100.0"

EIF="eth0"
EADR="128.49.130.142"
EMASK="24"
ENET="128.49.130.0"

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

#Accept outgoing traffic on external interface not destined for internal network
${IPTABLES} -A OUTPUT -o ${EIF} -d ! ${INET}/${IMASK} -j ACCEPT

#Accept UDP DNS Requests
${IPTABLES} -A OUTPUT -o ${EIF} -d ! ${INET}/${IMASK} -p udp --dport 53 -j ACCEPT

#Accept outgoing traffic on internal interface to local net only
${IPTABLES} -A OUTPUT -o ${IIF} -s ${IADR} -d ${INET}/${IMASK} -j ACCEPT

#Accept related,established traffic back in on external interface
${IPTABLES} -A INPUT -i ${EIF} -s ! ${INET}/${IMASK} -d ${EADR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept related,establishd traffic back in to internal interface only from local network
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -m state --state RELATED,ESTABLISHED -j ACCEPT


${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p icmp -j ACCEPT
#Accept incomming tcp ssh traffic on port 22 from local network.
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 22 -j ACCEPT

#Accept incomming tcp web traffic on port 80 from local network
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 80 -j ACCEPT

#Accept incomming tcp DNS requests on port 53 from local net
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 53 -j ACCEPT

#Accept incomming udp DNS requests on port 53 from local net
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 53 -j ACCEPT

#Accept incomming tcp netbios-ssn for samba from local net
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 139 -j ACCEPT

#Accept incomming tcp microsoft-ds for samba from local net
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 445 -j ACCEPT

#Accept incomming udp for Network Time Protocol
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 123 -j ACCEPT

#Accept incomming portmap connections on 111
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 111 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 111 -j ACCEPT

#Accept incomming nfs connections on port 2049
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 2049 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 2049 -j ACCEPT

#Accept incomming rpc.mountd connections (See /etc/conf.d/nfs)
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 32767 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 32767 -j ACCEPT

#Accept incomming rpc.status connections (See /etc/conf.d/nfs)
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p udp --dport 32765 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADR} -p tcp --dport 32765 -j ACCEPT

#MUST GO LAST

#LOG ALL OTHER INPUT
${IPTABLES} -A INPUT -i ${EIF} -j LOG --log-prefix 'iptables-eth0-in:'
${IPTABLES} -A INPUT -i ${IIF} -j LOG --log-prefix 'iptables-eth1-in:'

#LOG ALL OTHER OUTPUT
${IPTABLES} -A OUTPUT -o ${EIF} -j LOG --log-prefix 'iptables-eth0-out:'
${IPTABLES} -A OUTPUT -o ${IIF} -j LOG --log-prefix 'iptables-eth1-out:'
