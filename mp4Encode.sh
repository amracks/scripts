#!/bin/sh

mencoder -profile mp4720p1 -nosub -o "${2}" "${1}"
mencoder -profile mp4720p2 -nosub -o "${2}" "${1}"
