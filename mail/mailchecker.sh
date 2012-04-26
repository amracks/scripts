#!/bin/sh

fetchmail -s -c

case $? in
    0)
        echo New Mail
        ;;
    2)
        echo ERROR
        ;;
    3)
        echo Authentication Failed
        ;;
esac
