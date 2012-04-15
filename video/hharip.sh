#!/bin/sh

mencoder -nocache dvdnav://${1} -ovc frameno -vf lavcdeint,scale=72:480 -oac mp3lame -lameopts vbr=3 -ss ${2} -endpos ${3} -o frameno.avi -aid 128
mencoder -nocache dvdnav://${1} -oac copy -vf lavcdeint,scale=720:480 -ovc lavc -lavcopts vcodec=mpeg4:vpass=1:vbitrate=2000 -ss ${2} -endpos ${3} -o ${4}.avi -aid 128
mencoder -nocache dvdnav://${1} -oac copy -vf lavcdeint,scale=720:480 -ovc lavc -lavcopts vcodec=mpeg4:vpass=2:vbitrate=2000 -ss ${2} -endpos ${3} -o ${4}.avi -aid 128
rm frameno.avi divx2pass.log
