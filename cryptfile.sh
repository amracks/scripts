#!/bin/sh

ENCDRVE=${2}
LODEV=/dev/loop${3}
NAME=${4}
MNTPOINT=${5}

case ${1} in
    mount)
        sudo losetup ${LODEV} ${ENCDRVE}
        sudo cryptsetup -y create ${NAME} ${LODEV}
        sudo mount /dev/mapper/${NAME} ${MNTPOINT}
        ;;
    umount)
        sudo umount /dev/mapper/${NAME}
        sudo cryptsetup remove ${NAME}
        sudo losetup -d ${LODEV}
        ;;
    *)
        echo "mount filename loop# mapname mountpoint"
        echo "umount filename loop# mapname mountpoint"
        ;;
esac
