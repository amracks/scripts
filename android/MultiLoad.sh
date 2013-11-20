#!/bin/sh

for dev in `adb devices | grep 'device$' | awk '{print $1}'`
do
    ADBLoad ${dev} ${1} &
done
