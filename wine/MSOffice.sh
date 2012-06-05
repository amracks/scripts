#!/bin/sh

OFFICE14="C:\Program Files\Microsoft Office\Office14"

if [ ${1} == "word" ]; then
	wine "${OFFICE14}\WINWORD.EXE"
elif [ ${1} == "ppt" ]; then
	wine "${OFFICE14}\POWERPNT.EXE"
elif [ ${1} == "excel" ]; then
	wine "${OFFICE14}\EXCEL.EXE"
elif [ ${1} == "proj" ]; then
	wine "${OFFICE14}\WINPROJ.EXE"
fi
