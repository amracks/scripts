#!/bin/sh

uid=1000
gid=1000

if [ -z ${2} ]
then
    echo "must specify host"
    exit 1
fi

if [ "${1}" == "m" ]
then
    mkdir -p ~/sshfs/${2}
    sshfs -o idmap=user,uid=${uid},gid=${gid} amarks@${2}.amrx.net:/home/amarks ~/sshfs/${2}
elif [ "${1}" == "u" ]
then
    fusermount -u ~/sshfs/${2}
fi
