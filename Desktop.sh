#!/bin/sh

#pkg install -y hs-haskell-platform

packages="\
 nmap\
 ImageMagick\
 apache-ant\
 bash\
 bind-tools\
 cdparanoia\
 cdrtools\
 chromium\
 cscope\
 ctags\
 curl\
 dejavu\
 dmenu\
 dvd+rw-tools\
 eject\
 feh\
 ffmpeg\
 firefox\
 fusefs-ntfs\
 ghc\
 gimp\
 git\
 gnucash\
 gputils\
 hplip\
 hs-cabal-install\
 hs-xmobar\
 hs-xmonad\
 hs-xmonad-contrib\
 i386-wine\
 icedtea-web\
 links\
 lwjgl\
 mplayer\
 musicpc\
 musicpd\
 mutt\
 mysql55-client\
 nvidia-driver\
 nvidia-settings\
 openjdk\
 openjdk6\
 pidgin\
 puppet\
 rexima\
 robotfindskitten\
 ruby\
 ruby20\
 rxvt-unicode\
 scala\
 slim\
 slim-themes\
 syslinux\
 terminus-font\
 thunderbird\
 tmux\
 todo\
 uhidd\
 unzip\
 vim\
 virtualbox-ose\
 weechat\
 wget\
 wine-gecko\
 wine-mono\
 xev\
 xlockmore\
 xorg\
 xv\
 zsh\
 unrar\
 okular\
"

for p in $packages
do
  if [ `pkg info | grep $p | wc -l` -lt 1 ]
  then
    pkg install -y $p
  fi
done
