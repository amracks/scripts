#!/bin/sh

WINEARCH=win32
OFFICE14="C:\Program Files\Microsoft Office\Office14"

if [ ${1} == "word" ]; then
    WINEPREFIX=~/.wine32_office
	wine "${OFFICE14}\WINWORD.EXE"
elif [ ${1} == "ppt" ]; then
    WINEPREFIX=~/.wine32_office
	wine "${OFFICE14}\POWERPNT.EXE"
elif [ ${1} == "excel" ]; then
    WINEPREFIX=~/.wine32_office
	wine "${OFFICE14}\EXCEL.EXE"
elif [ ${1} == "proj" ]; then
    WINEPREFIX=~/.wine32_project
	wine "${OFFICE14}\WINPROJ.EXE"
elif [ ${1} == "visio" ]; then
    WINEPREFIX=~/.wine32_visio
	wine "${OFFICE14}\VISIO.EXE"
fi
