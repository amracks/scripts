#!/bin/sh

VERSION=$1

JARS="minecraft.jar lwjgl.jar jinput.jar lwjgl_util.jar windows_natives.jar linux_natives.jar macosx_natives.jar"
BASEURL="http://s3.amazonaws.com/MinecraftDownload"

mkdir -p ${VERSION}/lib
mkdir -p ${VERSION}/linux
mkdir -p ${VERSION}/osx
mkdir -p ${VERSION}/win32

for jar in $JARS
do
    wget -P ${VERSION}/lib "${BASEURL}/${jar}"
done

wget -P ${VERSION}/lib http://www.minecraft.net/download/minecraft_server.jar

#extract Linux natives
cd ${VERSION}/linux
jar xvf ../lib/linux_natives.jar
cd ../..

#extract Windows natives
cd ${VERSION}/win32
jar xvf ../lib/windows_natives.jar
cd ../..

#extract OSX natives
cd ${VERSION}/osx
jar xvf ../lib/macosx_natives.jar
cd ../..
