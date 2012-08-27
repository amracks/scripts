#!/bin/sh

BASE_URL="http://s3.amazonaws.com/MinecraftResources/"

wget -O index.xml "${BASE_URL}"

resources=`sed 's/</\n</g' index.xml | grep '<Key' | sed 's/<Key>//' | sed 's/ /%/g'`

for res in $resources
do
    r=`echo $res | sed 's/%/ /g'`
    if [[ $r == */ ]]
    then
#        d=`echo $r | sed 's/\/[^\/]*$//'`
#        if [ ! -d "${d}" ]
#        then
            mkdir -p "${r}"
#        fi
    else
        wget -O "${r}" "${BASE_URL}${r}"
    fi
done
