#!/bin/sh

INET="10.1.0.0/16"
EADR="128.49.130.142"
EIF=eth0
IIF=eth1

# $1 action
# $2 is address

if [ "${1}" == "e" ]
then
    iptables -A FORWARD -s ${2} ! -d ${INET} -i ${IIF} -j ACCEPT
    iptables -A FORWARD ! -s ${INET} -d ${2} -i ${EIF} -j ACCEPT
    iptables -t nat -A POSTROUTING -s ${2} ! -d ${INET} -j SNAT --to-source ${EADR}
elif [ "${1}" == "d" ]
then
    iptables -D FORWARD -s ${2} ! -d ${INET} -i ${IIF} -j ACCEPT
    iptables -D FORWARD ! -s ${INET} -d ${2} -i ${EIF} -j ACCEPT
    iptables -t nat -D POSTROUTING -s ${2} ! -d ${INET} -j SNAT --to-source ${EADR}
fi
