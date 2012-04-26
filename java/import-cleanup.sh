#!/bin/sh

SORT_IMPORTS="/usr/home/amrx/scripts/java/sort-imports.sh"

for source_file in $1
do
    for import in `grep '^import' ${source_file} | awk '{print $NF}'`
    do
        full_class=`echo ${import} | sed 's/;.*$//g'`
        class=`echo ${full_class} | awk -F. '{print $NF}'`
        if [ `grep -v '^import' ${source_file} | grep ${class} | wc -l` -lt 1 ]; then
            printf "${class} not used in ${source_file},\n Removing the corresponding import statement\n"
            sed -i '' "/^import..*${full_class}/d" $source_file
        fi
    done
    ${SORT_IMPORTS} ${source_file}
done
