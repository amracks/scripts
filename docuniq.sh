#!/bin/sh

DOCS=~/doc
DOCFILE=~/docuniq.txt

cat /dev/null > ${DOCFILE}
find ${DOCS} -type f -exec md5sum {} \; > ${DOCFILE}

for md5 in `awk '{print $1}' ${DOCFILE} | sort | uniq -d`
do
    echo "DUPLICATE FOUND:"
    grep "$md5" ${DOCFILE}
    echo
done
