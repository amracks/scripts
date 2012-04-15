#!/bin/sh

function usage() {
    echo "${0} Usage:"
    echo "   ${0} [u]mount <file> <mountpoint>"
    exit 1
}


if [ -z "${1}" ]
then
    usage
elif [ -z "${2}" ]
then
    usage
elif [ -z "${3}" ]
then
    usage
fi

MAPFILE=`echo ${2} | awk -F\. '{print $1}'`

case ${1} in
    mount)
        lodev=`sudo losetup -f`
        sudo losetup $lodev "${2}"
        sudo cryptsetup -y create "${MAPFILE}" $lodev
        sudo mount /dev/mapper/${MAPFILE} "${3}"
        ;;
    umount)
        lodev=`sudo losetup -a | grep "${2}" | awk -F: '{print $1}'`
        sudo umount ${3}
        sudo cryptsetup remove ${MAPFILE}
        sudo losetup -d $lodev
        ;;
    *)
        usage
        ;;
esac
