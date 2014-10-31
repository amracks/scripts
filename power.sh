#!/bin/sh

CFF=/sys/class/power_supply/BAT0/charge_full
CNF=/sys/class/power_supply/BAT0/charge_now

CF=`cat ${CFF}`
CN=`cat ${CNF}`

C=`echo "scale=2; (${CN} / ${CF}) * 100" | bc | sed 's/\..*$//'`

echo ${C}%
