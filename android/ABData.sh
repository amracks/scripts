#!/bin/sh

sdroot="/storage/sdcard0"

for json in `adb shell ls ${sdroot}/PatrolData/ | grep updated | sed 's/.*\/\([A-Za-z_\-\.]*.json\).*$/\1/g' | tr -d '\r'`
do
    ${1} adb pull ${sdroot}/PatrolData/${json}
done

for jpg in `adb shell ls ${sdroot}/Pictures/Screenshots | sed 's/.*\/\([A-Za-z_\-\.]*.png\).*$/\1/g' | tr -d '\r'`
do
    ${1} adb pull ${sdroot}/Pictures/Screenshots/${jpg}
done




${1} adb pull ${sdroot}/current.gpx
