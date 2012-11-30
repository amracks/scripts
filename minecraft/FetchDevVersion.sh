#!/bin/sh

#Fetches Minecraft Jars

VERSION=$1

if [ -z "$1" ]
then
    echo
    echo "Usage: ${0} {Version Number}"
    echo
    echo "Where {Version Number} is the dev version of Minecraft to download"
    echo "(This will make a directory called {Version Number} and put"
    echo "everthing in that directory)"
    echo
    exit;
fi


JARS="lwjgl.jar jinput.jar lwjgl_util.jar windows_natives.jar linux_natives.jar macosx_natives.jar"
BASEURL="http://s3.amazonaws.com/MinecraftDownload"

mkdir -p ${VERSION}/lib
mkdir -p ${VERSION}/linux
mkdir -p ${VERSION}/osx
mkdir -p ${VERSION}/win32

for jar in $JARS
do
    wget -P ${VERSION}/lib "${BASEURL}/${jar}"
done

wget -P ${VERSION}/lib "http://assets.minecraft.net/${VERSION}/minecraft.jar"
wget -P ${VERSION}/lib "http://assets.minecraft.net/${VERSION}/minecraft_server.jar"

#extract Linux natives
cd ${VERSION}/linux
jar xvf ../lib/linux_natives.jar
cd ../..

##extract Windows natives
cd ${VERSION}/win32
jar xvf ../lib/windows_natives.jar
cd ../..

##extract OSX natives
cd ${VERSION}/osx
jar xvf ../lib/macosx_natives.jar
cd ../..
