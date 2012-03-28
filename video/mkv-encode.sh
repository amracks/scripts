#!/bin/sh

#LAVC_OPTS="acodec=ac3:abitrate=640:threads=2:vcodec=libx264:vqmin=3"

LAVC_OPTS="acodec=ac3:abitrate=640:threads=2:vcodec=libx264"
mencoder -ovc frameno  -vf lavcdeint -oac mp3lame -lameopts vbr=3 -o frameno.avi
mencoder -ovc x264 -vf lavcdeint -oac lavc -lavcopts ${LAVC_OPTS}:vpass=1:turbo -of lavf -lavfopts format=matroska -o "${2}" "${1}"
mencoder -ovc x264 -vf lavcdeint -oac lavc -lavcopts ${LAVC_OPTS}:vpass=2 -of lavf -lavfopts format=matroska -o "${2}" "${1}"

# mencoder -ovc lavc -oac lavc -lavcopts ${LAVC_OPTS}:vpass=2 -of lavf -lavfopts format=matroska -o "${2}" "${1}"
