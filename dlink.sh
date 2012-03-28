#!/bin/sh

SENS=80

function setMotionDetection() {
    camip=${1}
    mdenable=${2}

    if [ "${mdenable}" == "1" ]
    then
        echo "Enabling Motion Detection for IP: ${camip}";
    elif [ "${mdenable}" == "0" ]
    then
        echo "Disabling Motion Detection for IP: ${camip}";
    fi
    #curl -u 'admin:tiadlp@w' --data "ReplySuccessPage=motion.htm&ReplyErrorPage=motion.htm&MotionDetectionEnable=${mdenable}&MotionDetectionSensitivity=${SENS}&ConfigSystemMotion=Save" http://${camip}/setSystemMotion

}

function getCamIp() {
    case ${1} in
        family1)
            CAMIP="10.27.182.10"
            ;;
        family2)
            CAMIP="10.27.182.11"
            ;;
        kitchen1)
            CAMIP="10.27.182.12"
            ;;
        kitchen2)
            CAMIP="10.27.182.13"
            ;;
        entry)
            CAMIP="10.27.182.14"
            ;;
        loft)
            CAMIP="10.27.182.15"
            ;;
        piano)
            CAMIP="10.27.182.16"
            ;;
        kitchen3)
            CAMIP="10.27.182.17"
            ;;
        butlerspantry)
            CAMIP="10.27.182.18"
            ;;
     esac
}

while getopts c:i:m: option
do
    case ${option} in
        c)
            getCamIp ${OPTARG}
            if [ -z "${CAMIP}" ]
            then
                echo "Unknown Camera Name: $OPTARG"
                exit 1
            fi
            ;;
        i)
            CAMIP=${OPTARG}
            ;;
        m)
            if [ "${OPTARG}" == "enable" ]
            then
                MDENABLE=1
            elif [ "${OPTARG}" == "disable" ]
            then
                MDENABLE=0
            fi
            ;;
    esac
done

if [ -z "${CAMIP}" ]
then
    for ip in 10 11 12 13 14 15 16 17 18
    do
        setMotionDetection "10.27.182.${ip}" ${MDENABLE}
    done
else
    setMotionDetection ${CAMIP} ${MDENABLE}
fi
