#!/bin/bash

IPTABLES="sudo /usr/sbin/iptables"
IFCONFIG="/sbin/ifconfig"

LO="lo"
LADR="127.0.0.1"

EIF="eth0"
EADDR=`${IFCONFIG} ${EIF} | grep addr | awk '{print $2}' | awk -F: '{print $2}'`
EMASK="24"
ENET="10.2.2.0" 

IIF="eth1"
IADDR=`${IFCONFIG} ${IIF} | grep addr | awk '{print $2}' | awk -F: '{print $2}'`
IMASK="24"
INET="10.1.100.0"

OUTBOUND_SVC_NAMES="ftp-data
                    ftp
                    ssh
                    telnet
                    smtp
                    bootps
                    domain
                    finger
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
                    pdl-datastream"

INBOUND_SVC_NAMES="ssh
                   domain
                   http
                   netbios-ssn
                   microsoft-ds
                   ntp
                   tftp"


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

TRUSTED_IPS="128.49.65.102
             128.49.130.153
             128.49.67.51
             128.49.65.101
             128.49.67.37
             128.49.65.161
             128.49.5.26"  

NS="128.49.4.2 128.49.4.3"
SMTP="128.49.4.2 128.49.4.3"

NO_TRAFFIC_IF="eth0"

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

#DROP EVERYTHING IN or OUT of NO_TRAFFIC_IF
${IPTABLES} -A INPUT -i ${NO_TRAFFIC_IF} -j DROP
${IPTABLES} -A OUTPUT -o ${NO_TRAFFIC_IF} -j DROP

##############################
# OUTPUT ON EXTERNAL INTERFACE
##############################

#Only accept output of traffic for specific application protocols
for app in ${OUTBOUND_SVC_NAMES}
do
    for entry in `awk '{print $1,$2}' /etc/services | grep "^${app} " | awk '{print $2}'`
    do
        port=`echo $entry |  awk -F\/ '{print $1}'`
        proto=`echo $entry | awk -F\/ '{print $2}'`
        ${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p ${proto} --dport ${port} -j ACCEPT
    done
done

#DROP Traffic out the external interface destined for reserved address space.
for src in ${RESERVED_ADDRS}
do
    ${IPTABLES} -A OUTPUT -o ${EIF} -d ${src} -j DROP
done

#Accept icmp out
${IPTABLES} -A OUTPUT -o ${EIF} -p icmp -j ACCEPT

#Accept outgoing web traffic on external interface for myBiz
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -p tcp --dport 8007   -j ACCEPT

#Accept traceroute out
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p udp --dport 33434:33655 -j ACCEPT
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} ! -d ${EADDR} -p tcp --dport 33434:33655 -j ACCEPT


##############################
# INPUT ON INTERNAL INTERFACE
##############################

#Only accept input for specific application protocols
for app in ${INBOUND_SVC_NAMES}
do
    for entry in `awk '{print $1,$2}' /etc/services | grep "^${app} " | awk '{print $2}'`
    do
        port=`echo $entry |  awk -F\/ '{print $1}'`
        proto=`echo $entry | awk -F\/ '{print $2}'`
        echo ${IPTABLES} -A INPUT -i ${IIF} -d ${IADDR} -p ${proto} --dport ${port} -j ACCEPT
    done
done

#Accept ICMP traffic in the internal interface.
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p icmp -j ACCEPT

#Accept incomming ftp from the axis camera on port 21
${IPTABLES} -A INPUT -i ${IIF} -s 10.1.100.151 -d ${IADDR} -p tcp --dport 21 -j ACCEPT

#Accept incomming unreal tournament connections on IIF
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p udp --dport 7777 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p udp --dport 7778 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p udp --dport 7779 -j ACCEPT
${IPTABLES} -A INPUT -i ${IIF} -s ${INET}/${IMASK} -d ${IADDR} -p udp --dport 7780 -j ACCEPT


#Let Trusted IP's to connect to my web server on EIF
#for src in ${TRUSTED_IPS}
#do
#    ${IPTABLES} -A INPUT -i ${EIF} -s ${src} -d ${EADDR} -p tcp --dport 80 -j ACCEPT
#done

#Accept related,established traffic back into external interface
${IPTABLES} -A INPUT -i ${EIF} -d ${EADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept outgoing related/established traffic on external interface 
${IPTABLES} -A OUTPUT -o ${EIF} -s ${EADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#Accept all outgoing traffic on internal interface.
${IPTABLES} -A OUTPUT -o ${IIF} -s ${IADDR} -d ${INET}/${IMASK} -j ACCEPT

#Accept related-established traffic back into internal interface
${IPTABLES} -A INPUT -i ${IIF} -d ${IADDR} -m state --state RELATED,ESTABLISHED -j ACCEPT

#LOG EVERYTHING ELSE
#${IPTABLES} -A INPUT -i eth0 -j LOG
#${IPTABLES} -A OUTPUT -o eth0 -j LOG

#TEMP accept all output on EIF
#${IPTABLES} -A OUTPUT -o ${EIF} -j ACCEPT

#Allow krups traffic
#${IPTABLES} -A INPUT -i ${IIF} -d ${IADDR} -s 10.1.100.70 -j ACCEPT