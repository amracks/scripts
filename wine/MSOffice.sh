#!/bin/sh

export WINEARCH=win32
OFFICE14="C:\Program Files\Microsoft Office\Office14"

if [ ${1} == "word" ]; then
    export WINEPREFIX=${HOME}/.wine_office
	wine "${OFFICE14}\WINWORD.EXE" "${2}"
elif [ ${1} == "ppt" ]; then
    export WINEPREFIX=${HOME}/.wine_office
	wine "${OFFICE14}\POWERPNT.EXE" "${2}"
elif [ ${1} == "excel" ]; then
    export WINEPREFIX=${HOME}/.wine_office
	wine "${OFFICE14}\EXCEL.EXE" "${2}"
elif [ ${1} == "outlook" ]; then
    export WINEPREFIX=${HOME}/.wine_office
	wine "${OFFICE14}\OUTLOOK.EXE"
elif [ ${1} == "proj" ]; then
    export WINEPREFIX=${HOME}/.wine_project
	wine "${OFFICE14}\WINPROJ.EXE"
elif [ ${1} == "visio" ]; then
    export WINEPREFIX=${HOME}/.wine_visio
	wine "${OFFICE14}\VISIO.EXE"
fi
