#!/bin/sh

OFFICE12="C:\Program Files\Microsoft Office\Office12"

if [ ${1} == "word" ]; then
	wine "${OFFICE12}\WINWORD.EXE"
elif [ ${1} == "ppt" ]; then
	wine "${OFFICE12}\POWERPNT.EXE"
elif [ ${1} == "excel" ]; then
	wine "${OFFICE12}\EXCEL.EXE"
elif [ ${1} == "proj" ]; then
	wine "${OFFICE12}\WINPROJ.EXE"
fi
