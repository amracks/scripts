#!/bin/sh

infile=$1
tmpfile="temp.mp4"
outfile=$2

#options="-vcodec libx264 -b 512k -flags +loop+mv4 -cmp 256 \
#-partitions +parti4x4+parti8x8+partp4x4+partp8x8+partb8x8 \
#-me_method hex -subq 7 -trellis 1 -refs 5 -bf 3 \
#-flags2 +bpyramid+wpred+mixed_refs+dct8x8 -coder 1 -me_range 16 \
#-g 250 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -qmin 10 \
#-qmax 51 -qdiff 4"

#ffmpeg -y -i "$infile" -an -pass 1 -threads 2 $options "$tmpfile";

#ffmpeg -y -i "$infile" -acodec libfaac -ar 44100 -ab 96k -pass 2 -threads 2 $options "$outfile"


#!/bin/bash
# Usage: dvd2bb <input<output filename>
#  ..example:  dvd2bb dvd://1 /path/to/save_directory/My_movie_title
# Specify the video and audio bitrates (kilobits per second).
# video bit rate should be somewhere between 264 and 512, depending on size/quality goals
# 64, 96, and 128 are commonly used audio bit rates (lower, med, better quality)
VIDEO_BITRATE=264
AUDIO_BITRATE=96
# Specify the resolution of the screen in the video player.
# When scaling it is recommended that both the H & W values are dividable by 16
# For BlackBerry Pearl use 240 x 176; most other modern smart-phones use 480x352
SCREEN_WIDTH=480
SCREEN_HEIGHT=272
# video codec used here is x264
# $1 is the input file; $2 is the output file
mencoder  "${infile}" \
  -o  "${outfile}" \
  -vf dsize=${SCREEN_WIDTH}:${SCREEN_HEIGHT}:2,scale=-8:-8,harddup \
  -oac faac \
  -faacopts mpeg=4:object=2:raw:br=$AUDIO_BITRATE \
  -of lavf \
  -lavfopts format=mp4 \
  -ovc x264 \
  -sws 9 \
  -channels 2 \
  -srate 48000 \
  -x264encopts nocabac:level_idc=30:bframes=0:bitrate=$VIDEO_BITRATE:threads=4:turbo=1:global_header:subq=5:frameref=6:partitions=all:trellis=1:chroma_me:me=umh:pass=1

mencoder  "${infile}" \
  -o  "${outfile}" \
  -vf dsize=${SCREEN_WIDTH}:${SCREEN_HEIGHT}:2,scale=-8:-8,harddup \
  -oac faac \
  -faacopts mpeg=4:object=2:raw:br=$AUDIO_BITRATE \
  -of lavf \
  -lavfopts format=mp4 \
  -ovc x264 \
  -sws 9 \
  -channels 2 \
  -srate 48000 \
  -x264encopts nocabac:level_idc=30:bframes=0:bitrate=$VIDEO_BITRATE:threads=4:turbo=1:global_header:subq=5:frameref=6:partitions=all:trellis=1:chroma_me:me=umh:pass=2

#nicmp4box -add %output% %final%

