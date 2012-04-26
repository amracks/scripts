#!/bin/sh

AXIS_DUMP=/media/blacknas/axis
TL_DIR=/media/blacknas/web/tl

if [ "$2 " == " " ]
then
    monthday=`date +%m.%d.%Y`
else
    monthday=$2
fi

mencoder "mf:///${AXIS_DUMP}/TimeLaps-${monthday}/*.jpg" -o ${TL_DIR}/TimeLaps-${monthday}.avi -fps 13 -ovc lavc -lavcopts vcodec=mpeg4

if [ $1 == '-cleanup' ]; then
    rm -rf ${AXIS_DUMP}/TimeLaps-${monthday}
fi
