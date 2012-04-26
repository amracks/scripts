#!/bin/sh

MNTPNT=~/sshfs/avm26
MNTOPT="uid=1000,gid=1000,idmap=user"
SSHRMT="amarks@avm26.spawar.navy.mil:/home/amarks"

if [ "${1} " == "mount " ]; then
    sshfs -o ${MNTOPT} ${SSHRMT} ${MNTPNT}
elif [ "${1} " == "umount " ]; then
    fusermount -u ${MNTPNT}
else
    echo "Usage:"
    echo "  mount     :mount the sshfs"
    echo "  umount    :un-mount the sshfs"
    echo "  reconnect :reconnect the sshfs"
fi
