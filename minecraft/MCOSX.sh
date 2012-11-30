#!/bin/sh

#Script to start Minecraft

JAVA=`which java`

if [ "${1} " == " " ]
then
    echo "You Must Specify A Player Name!"
    echo "Usage:"
    echo "  Minecraft.sh {Player Name}"
    exit
fi

MCDIR=`pwd`
VERSION=12w24a

#export LD_LIBRARY_PATH=${MCDIR}/${VERSION}/linux

CLASSPATH="."

for jar in `ls ${MCDIR}/${VERSION}/lib/*.jar`
do
    CLASSPATH=${CLASSPATH}:${jar}
done

export CLASSPATH

${JAVA} -Xmx2048m -Djava.library.path=${MCDIR}/${VERSION}/osx net.minecraft.client.Minecraft $1 $2
