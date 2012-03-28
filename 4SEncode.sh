#!/bin/sh

mencoder -profile 4sp1 -nosub -o "${2}" "${1}"
mencoder -profile 4sp2 -nosub -o "${2}" "${1}"
