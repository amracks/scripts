#!/bin/sh

if [ `ps | grep urxvtd | wc -l` -gt 0 ]
then
    urxvtd -q -o -f
fi

if [ `ps | grep xmobar | wc -l` gt 0 ]
then
    xmobar &
fi
