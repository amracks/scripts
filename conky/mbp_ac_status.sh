#!/bin/sh

on=$(cat /sys/bus/acpi/drivers/ac/ACPI0003:00/power_supply/ADP1/online)

if [ ${on} -eq 1 ]; then
    echo "On"
else
    echo "Off"
fi
