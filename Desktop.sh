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
 nmap\
 nvidia-driver\
 nvidia-settings\
 okular\
 openjdk\
 pidgin\
 rexima\
 robotfindskitten\
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

echo ${packages} | xargs pkg install -y
