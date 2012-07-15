#!/bin/sh

PUSHLIST=~/PushList.txt
TEMPFILE=/tmp/PushList.txt

OLDIFS=$IFS
IFS=$(echo -en "\n\b")

for f in `cat ${PUSHLIST}`
do
    #Copy file from pushList
    echo Copying $f
    scp -r -q "${f}" amarks@ridge.amrx.net:~/push;

    # Update PushList, remove first entry
    cp ${PUSHLIST} ${TEMPFILE}
    tail -n +2 ${TEMPFILE} > ${PUSHLIST}

    #Don't continue after 4:00 A.M. 
    if [ `date +%H` -gt 4 ];
    then
        break;
    fi
done

IFS=$OLDIFS
