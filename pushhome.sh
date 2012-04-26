#!/bin/sh

PUSHLIST=~/PushList.txt
TEMPFILE=/tmp/PushList.txt

for f in `cat ${PUSHLIST}`
do
    #Copy file from pushList
    echo Copying $f
    scp -q $f amarks@ridge.amrx.net:~/video/720p;

    # Update PushList, remove first entry
    cp ${PUSHLIST} ${TEMPFILE}
    tail -n +2 ${TEMPFILE} > ${PUSHLIST}

    #Don't continue after 4:00 A.M. 
    if [ `date +%H` -gt 4 ];
    then
        break;
    fi
done
