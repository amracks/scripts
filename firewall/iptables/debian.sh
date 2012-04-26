#!/bin/bash

IPTABLES="/sbin/iptables"
IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

EIF="eth1"
EADDR=`${IFCONFIG} ${EIF} | grep addr | awk '{print $2}' | awk -F: '{print $2}'`
EMASK="24"
ENET="128.49.130.0" 

IIF="eth2"
IADDR=`${IFCONFIG} ${IIF} | grep addr | awk '{print $2}' | awk -F: '{print $2}'`
IMASK="24"
INET="10.2.2.0"

VIP="10.2.2.1"

RESERVED_ADDRS="10.0.0.0/8 
		172.16.0.0/16 
                172.17.0.0/16 
                172.18.0.0/16 
                172.19.0.0/16 
                172.20.0.0/16 
                172.21.0.0/16 
                172.22.0.0/16 
                172.23.0.0/16 
                172.24.0.0/16 
                172.25.0.0/16 
                172.26.0.0/16 
                172.27.0.0/16 
                172.28.0.0/16 
                172.29.0.0/16 
                172.30.0.0/16 
                172.31.0.0/16 
                172.16.0.0/16 
                192.168.0.0/16"

NON_TEN_ADDRS="172.16.0.0/16 
               172.17.0.0/16 
               172.18.0.0/16 
               172.19.0.0/16 
               172.20.0.0/16 
               172.21.0.0/16 
               172.22.0.0/16 
               172.23.0.0/16 
               172.24.0.0/16 
               172.25.0.0/16 
               172.26.0.0/16 
               172.27.0.0/16 
               172.28.0.0/16 
               172.29.0.0/16 
               172.30.0.0/16 
               172.31.0.0/16 
               172.16.0.0/16"
               #192.168.0.0/16"
#
#TRUSTED_IPS="128.49.65.102
#             128.49.130.153
#             128.49.67.51
#             128.49.65.101
#             128.49.67.37
#             128.49.65.161
#             128.49.5.26"  

NS="128.49.4.2 128.49.4.3"
SMTP="128.49.4.2 128.49.4.3"

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

#Accept icmp out
${IPTABLES} -A OUTPUT -o ${EIF} -p icmp -j ACCEPT

#DROP Traffic out the external interface destined for reserved address space.
for src in ${RESERVED_ADDRS}
do
    ${IPTABLES} -A OUTPUT -o ${EIF} -d ${src} -j DROP
done

#Accept outgoing web traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -p tcp --dport 80   -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -p tcp --dport 8080   -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 443  -j ACCEPT

#Accept outgoing web traffic on external interface for myBiz
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -p tcp --dport 8007   -j ACCEPT

#Accept outgoing ssh traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 22  -j ACCEPT

#Accept outgoing ftp traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 20  -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 21  -j ACCEPT

#Accept outgoing dns traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 53  -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p udp --dport 53  -j ACCEPT

#Accept outgoing imaps traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 993  -j ACCEPT

#Accept outgoing hp jetdirect traffic on external interface
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 9100  -j ACCEPT

#Accept outgoing ntp traffic on EIF
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p udp --dport 123 -j ACCEPT

#Accept outgoing smtp traffic to smtp.spawar.navy.mil
for dest in ${SMTP}
do
    ${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -d ${dest} -p tcp --dport 25 -j ACCEPT
done

#Accept traceroute out
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p udp --dport 33434:33655 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 33434:33655 -j ACCEPT

#Accept cvs pserver out
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p udp --dport 2401 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 2401 -j ACCEPT

#Accept ICMP traffic in the internal interface.
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p icmp -j ACCEPT

#Accept related,established traffic back into eth0
${IPTABLES} -A INPUT -i ${EIF} -d ${EADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept outgoing related/established traffic on EIF
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept all outgoing traffic on internal interface.
${IPTABLES} -A OUTPUT -o ${IIF} -s ${IADDR} -d ${INET}/${IMASK} -j ACCEPT

#Accept related-established traffic back into internal interface
${IPTABLES} -A INPUT -i ${IIF} -d ${IADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

# nat through vm
${IPTABLES} -A FORWARD -i ${IIF} -o ${EIF} -s ${VIP} ! -d ${INET}/${IMASK} -j ACCPET
${IPTABLES} -A FORWARD -i ${EIF} -o ${IIF} -d ${VIP} ! -s ${INET}/${IMASK} -m state --state RELATED,ESTABLISHED -j ACCPET
${IPTABLES} -t nat -A POSTROUTING -i ${IIF} -o ${EIF} -s ${VIP} ! -d ${INET}/${IMASK} -j SNAT --to-source ${EADDR}
