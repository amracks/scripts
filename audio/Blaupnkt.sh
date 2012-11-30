#!/bin/sh

DEV=/dev/sdc1
MTPNT=/mnt/audio
MUSICDIR=/papa.smurf/Audio/Andrew
LISTFILE=/papa.smurf/Audio/Andrew/audiolist.txt

OIFS=${IFS}

IFS=$'\n'

function copyDir {
    artist=`echo "${1}" | awk -F'/' '{print $(NF-2)}' | sed 's/@/ /g' | tr "'" "\\'"`
    album=`echo "${1}" | awk -F'/' '{print $(NF-1)}' | sed 's/@/ /g' | tr "'" "\\'"`
    artist25=`echo "${artist}" | sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    album25=`echo "${album}" | sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    ${1} sudo mkdir -p "${MTPNT}/${artist25}/${album25}"
    for file in `find "${MUSICDIR}/${artist}/${album}" -name \*.mp3 | sed 's/ /@/g' | sort -n`
    do
        mp3=`echo ${file} | sed 's/@/ /g'`
        mp325=`echo ${mp3} | awk -F'/' '{print $NF}' | sed 's/^\(.\{1,20\}[^ ]\).*\.mp3/\1.mp3/'`
        echo "copy ${mp3}"
        ${1} sudo cp "${mp3}" "${MTPNT}/${artist25}/${album25}/${mp325}"
    done
}

function copyMP3 {
    artist=`echo "${1}" | awk -F'/' '{print $(NF-2)}' | sed 's/@/ /g' | sed 's/^\(.{1,24}[^ ]\).*/\1/'`
    album=`echo "${1}" | awk -F'/' '{print $(NF-1)}' | sed 's/@/ /g' | sed 's/^\(.{1,24}[^ ]\).*/\1/'`
    mp3=`echo "${1}" | awk -F'/' '{print $NF}' | sed 's/@/ /g' | sed 's/^\(.{1,20}[^ ]\).*\.mp3/\1.mp3/'`
    sudo mkdir -p "${MTPNT}/${artist}/${album}"
    #echo "sudo mkdir -p ${MTPNT}/${artist}/${album}"
    echo "copy ${mp3}"
    sudo cp "${1}" "${MTPNT}/${artist}/${album}"
    #echo "cp ${MUSICDIR}/${mp3} ${MTPNT}/${artist}/${album}"
}

if [ `mount | grep ${DEV} | wc -l` -gt 0 ]; then
    ${1} sudo umount ${DEV}
fi

${1} sudo mkdosfs ${DEV};
${1} sudo mount ${DEV} ${MTPNT};

cd ${MUSICDIR};

for entry in `cat ${LISTFILE}`
do
    if [ `echo ${entry} | grep mp3 | wc -l` -gt 0 ]; then
        copyMP3 ${entry}
    else
        copyDir ${entry}
    fi
done

${1} sudo umount ${DEV};

IFS=${OIFS}
