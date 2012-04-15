#!/bin/sh

HD=/dev/sdc1
MOUNTPOINT=/mnt/floppy
AUTOMNTPT=/media/usb1
MUSICDIR=/mnt/sdb/audio
LISTFILE=~/audiolist.txt

function copyMP3s {
    artist=`echo $1 | sed 's/\(.{1,25}\).*/\1/'`
    album=`echo $2 | sed 's/\(.{1,25}\).*/\1/'`
    for mp3 in `find ${MUSICDIR}/${1}/${2} -name \*.mp3`
    do
        mp3cp=`echo ${mp3}`
    done
}

if [ `mount | grep ${HD} | wc -l` -gt 0 ]; then
    umount ${HD}
fi

mkdosfs ${HD};
mount ${HD} ${MOUNTPOINT};

cd ${MUSICDIR};

for entry in `cat ${LISTFILE}`
do
    if [ `echo ${entry} | grep mp3 | wc -l` -gt 0 ]; then
    else
    fi
done

mp3s=`find ./ -name \*.mp3 | sed 's/ /@/g' | sed 's/^\.\///' | sort -n`

for mp3 in ${mp3s}
do
    if [ `echo ${mp3} | awk -F'/' '{print $NF}' | grep '^1*01' | wc -l` -gt 0 ]; then
        artist=`echo "${mp3}" | awk -F'/' '{print $1}'`
        album=`echo "${mp3}" | awk -F'/' '{print $2}'`

        albumCP=`echo ${album} | sed 's/\./_/g'`
        if [ `echo ${albumCP} | wc -m` -gt 25 ]; then
            albumCP=`echo ${albumCP} | sed 's/\(....................\).*/\1/'`
        fi

        artistCP=`echo ${artist} | sed 's/\./_/g'`
        if [ `echo ${artistCP} | wc -m` -gt 25 ]; then
            artistCP=`echo ${artistCP} | sed 's/\(....................\).*/\1/'`
        fi

        mkdir -p "${MOUNTPOINT}/${artistCP}/${albumCP}";
    fi

    mp3File=`echo ${mp3} | sed 's/@/ /g'`
    targetFile=`echo ${mp3} | awk -F'/' '{print $NF}' | sed 's/\.mp3//' | sed 's/@/_/g' | sed 's/\./_/g'`
    if [ `echo ${targetFile} | wc -m` -gt 20 ]; then
        targetFile=`echo ${targetFile} | sed 's/\(....................\).*/\1/'`
    fi
    targetFile=${targetFile}.mp3

    cp "${MUSICDIR}/${mp3File}" "${MOUNTPOINT}/${artistCP}/${albumCP}/${targetFile}";

done
