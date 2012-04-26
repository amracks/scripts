#!/bin/sh

for d in `ls`
do
    cd $d
    cvs -q update -dP
    cd ..
done
