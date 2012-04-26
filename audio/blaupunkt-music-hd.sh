#!/bin/sh

HD=/dev/sdb1
MOUNTPOINT=/mnt/floppy
MUSICDIR=/mnt/nfs/refrigerator/audio
AUDIOLIST=/home/amrx/etc/audiolist.txt

while getopts d:m:a:l: opt
do
    case $opt in
        d) HD="${OPTARG}";;
        m) MOUNTPOINT="${OPTARG}";;
        a) MUSICDIR="${OPTARG}";;
        l) AUDIOLIST="${OPTARG}";;
    esac
done

if [ `mount | grep ${HD} | wc -l` -gt 0 ]; then
    umount ${HD}
fi

echo "formatting..."

mkdosfs ${HD};
mount ${HD} ${MOUNTPOINT};

cd ${MUSICDIR};

echo "copying..."

#mp3s=`find ./ -name \*.mp3 | sed 's/ /@/g' | sed 's/^\.\///' | sort -n`

for dir in `cat ${AUDIOLIST}`
do
    olddir=`echo "${dir}" | sed 's/\^/ /g'`
    newdir=`echo $dir | awk -F\/ '{print $NF}' | sed 's/\^/_/g' | sed 's/.*\(....................\)$/\1/'`
    mkdir ${MOUNTPOINT}/${newdir}

    for mp3 in `ls "${MUSICDIR}/${olddir}" | grep mp3 | sed 's/ /^/g'`
    do
        oldsongname=`echo ${mp3} |  sed 's/\^/ /g'`
        number=`echo ${mp3} | sed 's/.*\([0-9][0-9]\).*/\1/'`
        newsongname=`echo "${number}-${mp3}" |  sed 's/\^/_/g' | sed 's/\(...\).*\(.................\)$/\1\2.mp3/'`
        cp "${MUSICDIR}/${olddir}/${oldsongname}" "${MOUNTPOINT}/${newdir}/${newsongname}"
    done

done

