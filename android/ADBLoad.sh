#!/bin/sh

pushroot="/storage/sdcard0"


if [ " ${1}" != " " ]
then
    adbarg="-s ${1}"
fi

#adb ${adbarg} shell rm ${pushroot}/PatrolData/*

#for apk in `find . -name \*.apk`
#do
#    ${2} adb ${adbarg} install -r "${apk}"
#done

for d in 1 2 3 4 5 6 7 8 9
do
    for dir in `find data -depth $d -type d`
    do
        dir=`echo $dir | sed 's/^data\///'`
        ${2} adb ${adbarg} shell mkdir ${pushroot}/${dir}
    done
done

for f in `find data -type f`
do
    base=`echo $f | sed 's/[^\/]*$//' | sed 's/^data\///'`
    ${2} adb ${adbarg} push "${f}" "${pushroot}/${base}"
done
