#!/bin/sh

DEV=/dev/sdb1
MTPNT=/mnt/audio
MUSICDIR=/home/amarks/music
LISTFILE=/home/amarks/audiolist.txt

function copyDir {
    artist=`echo "${1}" | awk -F'/' '{print $1}' | sed 's/@/ /g' | tr "'" "\\'"`
    album=`echo "${1}" | awk -F'/' '{print $2}' | sed 's/@/ /g' | tr "'" "\\'"`
    artist25=`echo "${artist}" | sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    album25=`echo "${album}" | sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    sudo mkdir -p "${MTPNT}/${artist25}/${album25}"
    for file in `find "${MUSICDIR}/${artist}/${album}" -name \*.mp3 | sed 's/ /@/g' | sort -n`
    do
        mp3=`echo ${file} | sed 's/@/ /g'`
        mp325=`echo ${mp3} | awk -F'/' '{print $NF}' | sed 's/^\(.\{1,20\}[^ ]\).*\.mp3/\1.mp3/'`
        echo "copy ${mp3}"
        sudo cp "${mp3}" "${MTPNT}/${artist25}/${album25}/${mp325}"
    done
}

function copyMP3 {
    artist=`echo "${1}" | awk -F'/' '{print $1}' | sed 's/@/ /g' | sed 's/^\(.{1,24}[^ ]\).*/\1/'`
    album=`echo "${1}" | awk -F'/' '{print $2}' | sed 's/@/ /g' | sed 's/^\(.{1,24}[^ ]\).*/\1/'`
    mp3=`echo "${1}" | awk -F'/' '{print $NF}' | sed 's/@/ /g' | sed 's/^\(.{1,20}[^ ]\).*\.mp3/\1.mp3/'`
    mkdir -p "${MTPNT}/${artist}/${album}"
    echo "copy ${MUSICDIR}/${mp3}"
    cp "${MUSICDIR}/${mp3}" "${MTPNT}/${artist}/${album}"
}

if [ `mount | grep ${DEV} | wc -l` -gt 0 ]; then
    sudo umount ${DEV}
fi

sudo mkdosfs ${DEV};
sudo mount ${DEV} ${MTPNT};

cd ${MUSICDIR};

for entry in `cat ${LISTFILE}`
do
    if [ `echo ${entry} | grep mp3 | wc -l` -gt 0 ]; then
        copyMP3 ${entry}
    else
        copyDir ${entry}
    fi
done

sudo umount ${DEV};
