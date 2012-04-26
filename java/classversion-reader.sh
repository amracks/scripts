#!/bin/sh

working_dir=~/tmp/vtmp
CLASSVERSION=~/bin/classversion

function jar_version() {
    jar_dir=`pwd`
    jar_name=`echo $jar_file | awk -F\/ '{print $NF}' | awk -F. '{print $1}'`
    mkdir ${working_dir}/${jar_name}
    cd ${working_dir}/${jar_name}
    jar -xf ${jar_dir}/${jar_file} 
    #find ${working_dir}/${jar_name} -name \*.class -exec ${CLASSVERSION} -f {} \; | sort | uniq -c | sort -rn | xargs | awk '{print $2}'
    find ${working_dir}/${jar_name} -name \*.class -exec ${CLASSVERSION} -f {} \; | sort | uniq -c 
}

function versionize_app() {
    components=`grep -v EXT ${appconfig_file} | grep required-component | awk '{print $2}' | awk -F\" '{print $2}'`

    jar_dir=`pwd`
    for jar in ${components}
    do
        mkdir ${working_dir}/${jar}
        cd ${working_dir}/${jar}
        jar -xvf ${jar_dir}/${jar} > /dev/null
        printf "\n ${jar}:\n"
        find ${working_dir}/${jar} -name \*.class -exec ${CLASSVERSION} -f {} \; | sort | uniq
    done
    echo ${components}
}

function versionize_dir() {
    cd ${directory}
    for jar in `ls *.jar`
    do
        mkdir ${working_dir}/${jar}
        cd ${working_dir}/${jar}
        jar -xvf ${directory}/${jar} > /dev/null
        printf "${jar}:\t"
        #find ${working_dir}/${jar} -name \*.class -exec ${CLASSVERSION} -f {} \; | sort | uniq -c | sort -rn
        find ${working_dir}/${jar_name} -name \*.class -exec ${CLASSVERSION} -f {} \; | sort | uniq -c | sort -rn | xargs | awk '{print $2}'
        cd ..
        rm -rf ${working_dir}/${jar}
    done
}


while getopts j:w:c:d: opt
do
    case $opt in
        j) jar_file=${OPTARG}
            jar_version;;
        w) working_dir=${OPTARG};;
        c) appconfig_file=${OPTARG}
            versionize_app;;
        d) directory=${OPTARG}
            versionize_dir;;
    esac
done
