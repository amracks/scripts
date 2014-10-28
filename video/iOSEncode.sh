#!/bin/sh

PASS="p1 p2"
TARGET="mp4720p"

function print_help() {
    printf "Usage: $0 [-t target] [-s] -i <input file> -o <output file>\n"
    printf "       $0 -h\n"
    printf "\n"
    printf "\t-t\tTarget encoding profile\n"
    printf "\t\t\tmp4720p\t- iOS compliant 720p (default)\n"
    printf "\t\t\t4s\t- iPhone 4S native resolution, low bitrate\n"
    printf "\t\t\tip\t- iPad 2 native resolution, medium bitrate\n"
    printf "\t-s\tSingle Pass (2 pass is default)\n"
    printf "\t-i\tMencoder input source (ex. an mkv file)\n"
    printf "\t-o\tmp4 output file\n"
    printf "\t-h\tPrint this help\n"
}

while getopts i:o:t:hs option
do
    case ${option} in
        i)
            IN_FILE="${OPTARG}"
            ;;
        o)
            OUT_FILE="${OPTARG}"
            ;;
        t)
            TARGET="${OPTARG}"
            ;;
        s)
            PASS="sp"
            ;;
        h)
            print_help
            exit
            ;;
    esac
done

if [ -a "${OUT_FILE}" ]
then
    echo "${OUT_FILE} already exists, choose a different file or move it out of the way"
    exit
fi

for p in ${PASS}
do
    mencoder -profile "${TARGET}${p}" -nosub -o "${OUT_FILE}" "${IN_FILE}"
done
