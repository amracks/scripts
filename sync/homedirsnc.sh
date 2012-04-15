#!/bin/bash

SYNCFILEBASE=~/etc/rsync

function locationSetup() {
    #Who am I?
    echo "I am ${HOSTNAME}"

    #Where am I?
    IPADDRS=`/sbin/ifconfig -a | grep 'inet addr' | awk '{print $2}' | awk -F: '{print $2}' | xargs`
    if [ `echo ${IPADDRS} | grep '10.1.100' | wc -l` -gt 0 ]; then
        echo "I am at Work, sync with 10.1.100.1 a.k.a fourcore"
        SYNCADDR="10.1.100.1"
    elif [ `echo ${IPADDRS} | grep '10.0.20' | wc -l` -gt 0 ]; then
        echo "I am at Home, sync with 10.0.20.2 a.k.a crossroads"
        SYNCADDR="10.0.20.2"
    else
        echo "I don't appear to be at home or work..."
        exit
    fi
}

function repoSync() {
    for repo in `cat ${SYNCFILEBASE}/replist-${HOSTNAME}.txt`
    do
        reptype=`echo ${repo} | awk -F: '{print $1}'`
        reploca=`echo ${repo} | sed 's/[^:]*://'`
        cd ~/${reploca}
        printf "\nDirectory Changed: ~/${reploca}\n"
        if [ $? -eq 0 -a ${reptype} == 'svn' ]; then
            svn status
            if [ `svn status | grep '^M' | wc -l` -gt 0 ]; then
                printf "Modified Files Detected, would you like to commit? (y or n)\n>"
                read response
                if [ `echo ${response} | grep '[Yy]' | wc -l` -gt 0 ]; then
                    printf "Committing Changes...\n"
                    svn commit
                fi
            fi
        elif [ ${reptype} == 'cvs' ]; then
            cvs -q update -dP
        else
            echo "Unknown repository type: ${repo}"
        fi
    done
}

function fileRSync() {
    for syncentry in `cat ${SYNCFILEBASE}/synclist-${HOSTNAME}.txt`
    do
        synctype=`echo ${syncentry} | awk -F: '{print $1}'`
        syncpath=`echo ${syncentry} | awk -F: '{print $2}'`
        if [ ${synctype} == 'd' ]; then
            printf "\npull changes for ${syncpath} from  ${SYNCADDR}..\n"
            rsync -aquz "${SYNCADDR}:/home/amarks/${syncpath}/" "/home/amarks/${syncpath}"
            printf "\npush changes for ${syncpath} to ${SYNCADDR}..\n"
            rsync -aquz "/home/amarks/${syncpath}/" "${SYNCADDR}:/home/amarks/${syncpath}"
        fi
    done
}

locationSetup
#repoSync
fileRSync


#Sync etc
#cd "${ETCDIR}"
#echo "${ETCDIR} status..."
#svn status
#if [ `svn status | grep '^M' | wc -l`  != 0 ]; then
#    echo "commiting changes"
#    DATE=`date`
#    svn commit -m "AutoCommit from ${HOSTNAME} ${DATE}"
#fi
#
##Sync scripts
#cd "${SCRIPTDIR}"
#echo 
#echo "${SCRIPTDIR} status..."
#svn status
#if [ `svn status | grep '^M' | wc -l`  != 0 ]; then
#    echo "commiting changes"
#    DATE=`date`
#    svn commit -m "AutoCommit from ${HOSTNAME} ${DATE}"
#fi
#
##rsync doc dir
#echo "rsync ${LOCDOCDIR} with ${REMDOCDOR}"
#echo "pull changes from  ${REMDOCDIR}.."
#rsync -avus "${REMDOCDIR}/" "${LOCDOCDIR}"
#echo "push changes to ${REMDOCDIR}.."
#rsync -avuz "${LOCDOCDIR}/" "${REMDOCDIR}"
