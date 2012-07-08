#!/bin/sh

case ${1} in
    [Oo][Nn])
        xrandr --output VGA1 --auto
        xrandr --output eDP1 --off
        xrandr --output VGA1 --auto
        ;;
    [Oo][Ff][Ff])
        xrandr --output eDP1 --auto
        #sleep 1
        #xrandr --output VGA1 --off
esac
