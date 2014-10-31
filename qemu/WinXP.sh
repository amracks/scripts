#!/bin/sh

MEMORY=1024
HD=~/VM/xp.img

qemu \
	-m ${MEMORY} \
	-hda  ${HD} \
	-enable-kqemu \
	-sdl
