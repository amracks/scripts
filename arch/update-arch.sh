#!/bin/sh

yaourt -Syy
yaourt --noconfirm -Su
sudo freshclam
