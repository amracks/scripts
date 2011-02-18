#!/bin/bash

IPTABLES="sudo /usr/sbin/iptables"

#Flush
${IPTABLES} -F
${IPTABLES} -t nat -F

#Set all policys to ACCEPT
${IPTABLES} -P INPUT ACCEPT
${IPTABLES} -P FORWARD ACCEPT
${IPTABLES} -P OUTPUT ACCEPT


