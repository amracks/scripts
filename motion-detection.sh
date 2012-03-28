#!/bin/sh

ENABLE=0;
SENS=80;

if [ "${1}" -eq "enable" ]
then
    ENABLE=1
    PROCEED="x"
elif [ "$1" -eq "disable" ]
then
    ENABLE=0
    PROCEED="x"
fi
    
if [ "${PROCEED} " -eq "x "]
then
    for cam in 10 11 12 13 14 15 16 17 18
    do
        echo 
        curl -u 'admin:tiadlp@w' --data "ReplySuccessPage=motion.htm&ReplyErrorPage=motion.htm&MotionDetectionEnable=${ENABLE}&MotionDetectionSensitivity=${SENS}&ConfigSystemMotion=Save" http://10.27.182.${cam}/setSystemMotion
    done
k
fi


 #curl -u 'admin:tiadlp@w' --data 'ReplySuccessPage=motion.htm&ReplyErrorPage=motion.htm&MotionDetectionEnable=1&MotionDetectionSensitivity=80&ConfigSystemMotion=Save' http://10.27.182.18/setSystemMotion

