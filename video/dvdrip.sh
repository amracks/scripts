#!/bin/sh

for n in $@
do 
    mencoder dvd://${n} -ovc frameno -vf lavcdeint,scale=640:480 -oac mp3lame -lameopts vbr=3 -o frameno.avi -aid 128
    mencoder dvd://${n} -oac copy -vf lavcdeint,scale=640:480 -ovc lavc -lavcopts vcodec=mpeg4:vpass=1:vbitrate=1000 -o CS.S01.E0${n}.avi -aid 128
    mencoder dvd://${n} -oac copy -vf lavcdeint,scale=640:480 -ovc lavc -lavcopts vcodec=mpeg4:vpass=2:vbitrate=1000 -o CS.S01.E0${n}.avi -aid 128
    rm frameno.avi divx2pass.log
done
