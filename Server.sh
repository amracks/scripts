#!/bin/sh

packages="\
 ImageMagick\
 android-tools-adb\
 apache-ant\
 autoconf\
 automake\
 bash\
 bind-tools\
 bison\
 cdparanoia\
 cdrtools\
 cmake\
 cscope\
 ctags\
 curl\
 dvd+rw-tools\
 eject\
 fusefs-ntfs\
 gcc\
 gdbm\
 git\
 gmake\
 hs-haskell-platform\
 hs-yesod-bin\
 i386-wine\
 icu\
 libtool\
 libxml2\
 libxslt\
 libyaml\
 links\
 nginx\
 nmap\
 openjdk6\
 openjdk\
 pkgconf\
 postgresql93-client\
 postgresql93-server\
 python2\
 readline\
 redis\
 samba36\
 scala\
 sqlite3\
 sudo\
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
"

services="\
 zfs\
 sshd\
 powerd\
 ntpdate\
 ntpd\
 samba\
 tomcat7\
 nginx\
 sendmail\
 redis\
 postgresql\
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
