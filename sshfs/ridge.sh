#!/bin/sh

MNTPNT=~/sshfs/ridge
MNTOPT="uid=1000,gid=1000,idmap=user"
SSHRMT="atm@ridge.amrx.net:/home/atm"

if [ "${1} "  == "mount " ]; then
    sshfs -o ${MNTOPT} ${SSHRMT} ${MNTPNT}
elif [ "${1} " == "umount " ]; then
    fusermount -u ${MNTPNT}
else
    echo "Usage:"
    echo "  mount    :mount the sshfs"
    echo "  umount   :mount the sshfs"
fi
