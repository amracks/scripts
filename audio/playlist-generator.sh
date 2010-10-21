#!/bin/sh

if [`find . -type d | grep ' ' | wc -l` -gt 0 ]; then
    echo "BAD! no spaces in dir names please."    
    exit 1
fi

for dir in `find . -type d`
do
    mp3count=`ls ${dir} | grep -i mp3 | wc -l`
    m3ucount=`ls ${dir} | grep -i m3u | wc -l`
    if [ $mp3count -gt 0 -a $m3ucount -eq 0 ]; then
        albumName=`echo ${dir} | awk -F\/ '{print $NF}'`
        ls ${dir} > ${dir}/${albumName}-autogen.m3u
        #echo "${albumName} has ${mp3count} songs and no playlist"
    fi
done
