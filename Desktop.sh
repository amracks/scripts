#!/bin/sh

packages="\
 ImageMagick\
 android-tools-adb\
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
 hs-haskell-platform\
 hs-hoogle\
 hs-xmobar\
 hs-xmonad-contrib\
 hs-xmonad\
 hs-yesod-bin\
 i386-wine\
 icedtea-web\
 links\
 lwjgl\
 mesa-demos\
 mplayer\
 musicpc\
 musicpd\
 mutt\
 mysql55-client\
 nmap\
 nvidia-driver\
 nvidia-settings\
 okular\
 openjdk6\
 openjdk\
 pidgin\
 postgresql93-client\
 postgresql93-server\
 puppet\
 rexima\
 robotfindskitten\
 ruby20\
 ruby\
 rxvt-unicode\
 scala\
 slim-themes\
 slim\
 sudo\
 syslinux\
 terminus-font\
 thunderbird\
 tmux\
 todo\
 uhidd\
 unrar\
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
"
services="\
 zfs\
 sshd\
 ntpd\
 postgresql\
 dbus\
 hald\
 musicpd\
 hcsecd\
 sdpd\
 bthidd\
"

#Install all packages
for p in $packages
do
  if [ `pkg info | grep "^$p-" | wc -l` -lt 1 ]
  then
    pkg install -y $p
  fi
done

#Start all services
for s in $services
do
    if [ `grep "^${s}_enable=\"YES\"" /etc/rc.conf | wc -l` -lt 1 ]
    then
        echo "${s}_enable=\"YES\"" >> /etc/rc.conf
        service ${s} start
    fi
done
