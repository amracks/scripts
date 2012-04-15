#!/bin/sh

url=`echo ${1} | sed 's/blocked//'`

firefox "${url}"
