#!/bin/sh

#Copy all music to drive, no elements over 25 char

DEV=/dev/sdh1
MNTPNT=/mnt/audio
MUSICDIR=/papa.smurf/Audio/Andrew

if [ `mount | grep ${DEV} | wc -l` -gt 0 ]; then
    sudo umount ${DEV}
fi

echo "Makeing filesystem"
sudo mkdosfs ${DEV};
sudo mount ${DEV} ${MNTPNT};

IFS=$(echo -en "\n\b")

for mp3 in `find ${MUSICDIR} -name \*.mp3 -type f | sort -n`
do
    artist=`echo ${mp3} | awk -F\/ '{print $6}' | sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    album=`echo ${mp3} | awk -F\/ '{print $7}' |  sed 's/^\(.\{1,24\}[^ ]\).*/\1/'`
    filename=`echo ${mp3} | sed 's/^.*\///'`
    filename=`echo ${filename} | sed 's/^\(.\{1,21\}\).*\.mp3/\1.mp3/'`
    #echo "cp ${mp3} ${MNTPNT}/${artist}/${album}/${filename}"
    echo "Copying  ${mp3}"
    sudo mkdir -p "${MNTPNT}/${artist}/${album}"
    sudo cp "${mp3}" "${MNTPNT}/${artist}/${album}/${filename}"
done
