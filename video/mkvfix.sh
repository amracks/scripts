#!/bin/sh

mkvmerge -o ${1} --engage keep_bitstream_ar_info -A -S --compression -1:none ${2} -D -S --compression -1:none ${2}
