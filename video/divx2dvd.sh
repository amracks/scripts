#!/bin/sh

ASPECT=16/9
BITRATE=4800
THREADS=1
NUM_PASS=2
eflag=
sflag=



while getopts a:b:e:s:o:t:p:v opt
do
    case $opt in
        a)  ASPECT=${OPTARG};;
	b)  BITRATE=${OPTARG};;
	e)  eflag=1
	    EXPAND="expand=${OPTARG}";;
	s)  sflag=1
	    SCALE="scale=${OPTARG}";;
	o)  oflag=1
	    FILE_OUT="-o ${OPTARG}";;
	t)  THREADS=${OPTARG};;
	p)  NUM_PASS=${OPTARG};;
	v)  VERBOSE=1;;
    esac
done

shift $(($OPTIND - 1))

if [ -z ${VERBOSE} ]; then
    output=`echo $FILE_OUT | sed 's/-o //g'`
    echo "Starting DVD Encoding Process"
    echo "----------------------------------------------"
    echo "Input:	${*}"
    echo "Output:	${output}"
    echo "Aspect:	${ASPECT}"
    echo "BITRATE:	${BITRATE}"
    echo "EXPAND:	${EXPAND}"
    echo "SCALE:	${SCALE}"
    echo "Passes:	${NUM_PASS}"
fi

PASS_1="mencoder -of mpeg -mpegopts format=dvd -srate 48000 -ofps 30000:1001 -ovc lavc -oac lavc -lavcopts vcodec=mpeg2video:vrc_buf_size=1835:keyint=18:vrc_maxrate=9800:vbitrate=${BITRATE}:aspect=${ASPECT}:acodec=ac3:abitrate=192:vmax_b_frames=2:vb_strategy=1:vpass=1:threads=${THREADS}:turbo -vf harddup"


if [ ! -z "$eflag" ]; then
   PASS_1="${PASS_1},${EXPAND}"
fi

if [ ! -z "$sflag" ]; then
    PASS_1="${PASS_1},${SCALE} "
fi

if [ ! -z "$oflag" ]; then
    PASS_1="${PASS_1} ${FILE_OUT} "
fi

PASS_1="${PASS_1} ${*}"
PASS_2=`echo ${PASS_1} | sed 's/:turbo//g' | sed 's/vpass=1/vpass=2/g'`
PASS_3=`echo ${PASS_1} | sed 's/:turbo//g' | sed 's/vpass=1/vpass=3/g'`

if [ ${NUM_PASS} -gt 2 ]; then
    echo "Running Pass 1, Output to stderr pass1.log"
    ${PASS_1} 2> pass1.log
    for (( x = 2 ; x <= $NUM_PASS ; x++ ))
    do
        echo "Running Pass $x, Output stderr to pass${x}.log"
	${PASS_3} 2> pass${x}.log
    done
else
    echo "Running Pass 1, Output to pass1.log"
    ${PASS_1} 2> pass1.log
    echo "Running Pass 2, Output to pass2.log"
    ${PASS_1} 2> pass2.log
fi
    
