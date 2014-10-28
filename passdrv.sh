#!/bin/sh

PASSDRVE=~/doc/passdrv
LODEV=/dev/loop6
MNTPOINT=~/.passdrv

case ${1} in
    mount)
        sudo losetup ${LODEV} ${PASSDRVE}
        sudo cryptsetup -y create passdrv ${LODEV}
        sudo mount /dev/mapper/passdrv ${MNTPOINT}
        ;;
    umount)
        sudo umount /dev/mapper/passdrv
        sudo cryptsetup remove passdrv
        sudo losetup -d ${LODEV}
        ;;
    *)
        echo "mount to mount the password drive"
        echo "umount to unmount"
        ;;
esac
