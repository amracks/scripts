#!/bin/bash

MOVDIR=/pub/media/video/720p
BURNDIR=/pub/media/video/720p/HD
BURNDEV=/dev/sr0

for m in `ls -lh ${MOVDIR}/*.mkv | grep '4.4G' | awk '{print $NF}' | awk -F\/ '{print $NF}'`
do
    echo "Insert blank disc to burn ${m}"
    read burn
    if [ "${burn} " == "y " ]; then
        mv "${m}" "${BURNDIR}";
        growisofs -dvd-compat -speed=16 -allow-limited-size -Z /dev/sr0 "${BURNDIR}";
        if [ $? -eq 0 ]; then
            rm -rf ${BURNDIR}/*;
            eject /dev/sr0;
            echo "-------------- ${m} ----------------";
        else
            echo "ERROR BURING:  ${m}";
        mv "${BURNDIR}/${m}" "${MOVDIR}";
        fi
    else
        exit 0
    fi
done
