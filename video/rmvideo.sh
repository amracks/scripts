#!/bin/sh

for f in `find . -type f | sed 's/ /@/g'`
do
    file=`echo ${f} | sed 's/@/ /g'`
    mplayer "${file}";
    echo "Delete? (y/n)"
    read delete
    if [ "${delete} " == "y " ]
    then
        rm "${file}"
    fi
done
