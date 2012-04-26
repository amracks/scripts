#!/bin/sh

VERSION_FILE=/iso/sysrcd-version.txt
ISO_FILE=/iso/sysrcd.iso
HTML_FILE=/tmp/sysrcd.html
SYSRCD_MNT=/var/tftpboot/sysrcd

srcd_currversion=`cat ${VERSION_FILE}`
wget -q -O ${HTML_FILE} http://www.sysresccd.org/Download
srcd_version=`grep 'SystemRescueCd-x86-' ${HTML_FILE} | awk -F\- '{print $NF}' | sed 's/<..*$//'`
srcd_dl=`grep 'sourceforge.net/projects/.*sysresccd-x86' ${HTML_FILE} | awk -F\" '{print $2}'`

#echo Current Version: ${srcd_version}
#echo Download Link:   ${srcd_dl}

if [ "${srcd_currversion}" != "${srcd_version}" ]
then
    echo "Update System Rescue CD: ${srcd_currversion} --> ${srcd_version}"
    wget -q -O ${ISO_FILE} "${srcd_dl}"
    echo ${srcd_version} > ${VERSION_FILE}
    umount ${SYSRCD_MNT}
    mount ${SYSRCD_MNT}
fi
