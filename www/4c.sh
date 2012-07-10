#!/bin/sh

i=1
lf=list.txt

board=${1}

function image() {
    name=`echo ${1} | awk -F\/ '{print $NF}'`
    trd=`echo ${2} | awk -F\/ '{print $NF}'`
    if [ `grep $name $lf | wc -l` -lt 1 ]; then
        echo "get ${1}"
        wget -q -O ${trd}-${name} http://${1} #&
        echo ${name} >> $lf
    else
        echo "skipping ${1}"
    fi
}

function thread() {
    echo "process thread ${1}"
    wget -q -O thread.htm http://boards.4chan.org/${board}/${1}
    #images=` awk '{print $11}' thread.htm | grep 'images\.4' | awk -F\" '{print $2}' | grep jpg`
    images=`sed 's/href="\/\/\(images\.4chan[^"]*\)"/\n\1\n/g' thread.htm | grep 'images\.4' | grep jpg`
    for img in ${images}
    do
        image ${img} ${1}
    done
}

wget -q -O i0.htm http://boards.4chan.org/${board}

while [ ${i} -lt ${2} ]
do
    echo "get page ${i}"
    wget -q -O i${i}.htm http://boards.4chan.org/${1}/${i}
    i=$((i + 1))
done

i=0
while [ ${i} -lt ${2} ]
do
    #threads=`awk '{print $12}' i${i}.htm | grep Reply | awk -F\" '{print $2}'`
    threads=`sed 's/\(<a[^>]*replylink\)/\n\1\n/g' i${i}.htm | grep replylink | awk -F\" '{print $2}'`
    for t in $threads
    do
        thread $t
    done
    i=$((i + 1))
done

rm *.htm
