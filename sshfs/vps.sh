#!/bin/sh

MNTPNT=~/sshfs/vps
MNTOPT="uid=1000,gid=1000,idmap=user"
SSHRMT="amarks@vps.amrx.net:/home/amarks"

if [ "${1} " == "mount " ]; then
    sshfs -o ${MNTOPT} ${SSHRMT} ${MNTPNT}
elif [ "${1} " == "reconnect " ]; then
    sshfs -o ${MNTOPT},reconnect ${SSHRMT} ${MNTPNT}
elif [ "${1} " == "umount " ]; then
    fusermount -u ${MNTPNT}
else
    echo "Usage:"
    echo "  mount    :mount the sshfs"
    echo "  umount   :mount the sshfs"
fi
