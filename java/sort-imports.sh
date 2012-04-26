#!/bin/sh

#move the file out of the way
mv ${1} ${1}.old

#copy everything before the import statements
index=`grep -m 1 -n '^import' ${1}.old | awk -F: '{print $1}'`
index=$(($index - 1))
sed -n 1,${index}p ${1}.old > ${1}

#copy over the import statements, sorting them on the way
grep '^import' ${1}.old | sort | uniq >> ${1}

#copy the rest of the file over after the sorted import statements
count=`grep '^import' ${1}.old | wc -l`
index=$((${count} + 1 + ${index}))
end=`wc -l ${1}.old | awk '{print $1}'`
sed -n ${index},${end}p ${1}.old >> ${1}

#remove the old file
rm ${1}.old
