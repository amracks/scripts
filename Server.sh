#!/bin/sh

packages="\
 ImageMagick\
 android-tools-adb\
 apache-ant\
 bash\
 bind-tools\
 cdparanoia\
 cdrtools\
 cscope\
 ctags\
 curl\
 dvd+rw-tools\
 eject\
 fusefs-ntfs\
 git\
 hs-haskell-platform\
 hs-yesod-bin\
 i386-wine\
 links\
 nginx\
 nmap\
 openjdk6\
 openjdk\
 samba36\
 scala\
 syslinux\
 tmux\
 todo\
 tomcat7\
 unrar\
 unzip\
 vim\
 virtualbox-ose\
 weechat\
 wget\
 wine-gecko\
 wine-mono\
 zsh\
 postgresql93-server\
 postgresql93-client\
 redis\
"

for p in $packages
do
  if [ `pkg info | grep "^$p-" | wc -l` -lt 1 ]
  then
    pkg install -y $p
  fi
done
