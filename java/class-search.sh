#!/bin/sh

for jar in `ls *.jar`
do
    if [ ` jar -tvf ${jar} | grep $1 | wc -l` -gt 0 ]; then
        echo $jar
        jar -tvf ${jar} | grep "$1"
    fi
done
