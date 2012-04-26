#!/bin/sh

addr=`dig +short $1`
if [ `echo $addr | wc -l` -gt 1 ]; then 
    fhost=`netselect $1 | awk '{print $2}'`
else
    fhost=$addr
fi

su -c "irssi -c $fhost -n amrx" - ircusr
