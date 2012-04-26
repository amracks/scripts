#!/bin/sh

curr=${1}
slides=${2}

while [ ${curr} -lt ${slides} ]
do
    xdotool click 1
    curr=$((curr + 1))
done
