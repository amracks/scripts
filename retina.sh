#!/bin/sh
( acroread -version || /usr/Adobe/Reader8/bin/acroread -version || /opt/Adobe/Reader8/bin/acroread -version || /usr/lpp/Adobe/Reader8/bin/acroread -version )
( acroread -version || /usr/Adobe/Reader9/bin/acroread -version || /opt/Adobe/Reader9/bin/acroread -version || /usr/lpp/Adobe/Reader9/bin/acroread -version )
all=$(\ls -1q /home/); for user in $all; do [ -d "/home/$user/.webex" ] && (\ls -1q "/home/$user/.webex/"| egrep "atascli.so.*" | tr -d '\n'); done; unset all
all=$(\ls -1q /home/); for user in $all; do [ -d "/home/$user/.webex" ] && (\ls -1q "/home/$user/.webex/"| egrep "atjpeg.so.*" | tr -d '\n'); done; unset all
asadmin version
baseDir=`grep BaseDir /etc/Symantec.conf | sed 's/BaseDir=//'`;definitions="$baseDir"/virusdefs/definfo.dat;latest=`grep CurDefs "$definitions" | sed 's/CurDefs=//'`;ls --full-time "$baseDir"/virusdefs/"$latest"/VIRSCAN1.dat
B=".mozilla .netscape"; L="/usr/lib/mozilla /usr/lib/netscape /usr/lib/opera /usr/lib/firefox /usr/local/netscape /usr/local/mozilla /usr/local/firefox /usr/local/seamonkey /opt/mozilla /opt/netscape /opt/firefox /opt/seamonkey /usr/lib/iceape /usr/lib/iceweasel /usr/lib/midbrowser /usr/lib/xulrunner /usr/lib/xulrunner-addons"; for D in $L; do if [ -h "$D" ]; then continue; fi; if [ -d "$D/plugins" ]; then if [ -r "$D/plugins/libflashplayer.so" ]; then echo "$D/plugins/libflashplayer.so"; strings "$D/plugins/libflashplayer.so" | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; fi; done; if [ -r "/home" ]; then for U in `\ls -1 "/home"`; do if [ -r "/home/$U" ]; then for C in $B; do if [ -r "/home/$U/$C/plugins/libflashplayer.so" ]; then echo "/home/$U/$C/plugins/libflashplayer.so"; strings "/home/$U/$C/plugins/libflashplayer.so" | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; done; fi; done; fi; if [ -r "/usr/lib/adobe-flashplugin/libflashplayer.so" ]; then strings /usr/lib/adobe-flashplugin/libflashplayer.so | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; unset B L;
B=".mozilla .netscape"; L="/usr/lib/mozilla /usr/lib/netscape /usr/lib/opera /usr/lib/firefox /usr/local/netscape /usr/local/mozilla /usr/local/firefox /usr/local/seamonkey /opt/mozilla /opt/netscape /opt/firefox /opt/seamonkey /usr/lib/iceape /usr/lib/iceweasel /usr/lib/midbrowser /usr/lib/xulrunner /usr/lib/xulrunner-addons"; for D in $L; do if [ -h "$D" ]; then continue; fi; if [ -d "$D/plugins" ]; then if [ -r "$D/plugins/libflashplayer.so" ]; then echo "$D/plugins/libflashplayer.so"; strings "$D/plugins/libflashplayer.so" | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; fi; done; if [ -r "/home" ]; then for U in $(\ls -1 "/home"); do if [ -r "/home/$U" ]; then for C in $B; do if [ -r "/home/$U/$C/plugins/libflashplayer.so" ]; then echo "/home/$U/$C/plugins/libflashplayer.so"; strings "/home/$U/$C/plugins/libflashplayer.so" | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; done; fi; done; fi; if [ -r "/usr/lib/adobe-flashplugin/libflashplayer.so" ]; then strings /usr/lib/adobe-flashplugin/libflashplayer.so | egrep "[0-9]+,[0-9]+,[0-9]+,[0-9]+"; fi; unset B L;
B=".mozilla .netscape"; L="/usr/lib/mozilla /usr/lib/netscape /usr/lib/opera /usr/lib/firefox /usr/local/netscape /usr/local/mozilla /usr/local/firefox /usr/local/seamonkey /opt/mozilla /opt/netscape /opt/firefox /opt/seamonkey /usr/lib/iceape /usr/lib/iceweasel /usr/lib/midbrowser /usr/lib/xulrunner /usr/lib/xulrunner-addons"; for D in $L; do if [ -h "$D" ]; then continue; fi; if [ -d "$D/plugins" ]; then if [ -r "$D/plugins/libflashplayer.so" ]; then echo "$D/plugins/libflashplayer.so"; strings "$D/plugins/libflashplayer.so" | grep "^Shockwave Flash [.\d+]*"; fi; fi; done; if [ -r "/home" ]; then for U in $(\ls -1 "/home"); do if [ -r "/home/$U" ]; then for C in $B; do if [ -r "/home/$U/$C/plugins/libflashplayer.so" ]; then echo "/home/$U/$C/plugins/libflashplayer.so"; strings "/home/$U/$C/plugins/libflashplayer.so" | grep "^Shockwave Flash [.\d+]*"; fi; done; fi; done; fi; if [ -r "/usr/lib/adobe-flashplugin/libflashplayer.so" ]; then strings /usr/lib/adobe-flashplugin/libflashplayer.so | grep "^Shockwave Flash [.\d+]*"; fi; unset B L;
bzip2 --help
camstat
( cat /etc/issue 2>/dev/null | grep -Ei "((ESX 4)|(^VMware))" ) || ( uname | grep -Ei "^VMkernel" ) || ( test ! -e /opt/McAfee/cma/bin && echo "notinstalled" )
(cat /etc/oracle-release | grep Oracle) && (rpm -qa | grep oracle)
cat /etc/ssh/sshd_config | grep Permit; cat /etc/sshd_config | grep Permit
cat /etc/SuSE-release |egrep -i 'SUSE'  || cat /etc/redhat-release |egrep -i 'Red[ ]?Hat' || uname -s -r
cat /opt/HP/SiteScope/installation/dat/product.xml | grep current_version
cat /opt/IBM/FIM/etc/version.properties | grep -Ei "itfim\.build\.version\.mgmtcon=.*"
cat /perfigo/build
( cat /perfigo/build | grep -i "NAME=Clean Access Manager" ) && cat /perfigo/build
cat /usr/openv/netbackup/version | egrep 'NetBackup ((6\.[05])|(5\.1))' && ls /usr/openv/pack/pack.summary && ( cat /usr/openv/pack/pack.summary | egrep 'NB_JAV_((6\.5\.([1-9][0-9]+|[2-9])(\..*)?)|(51_([1-9][0-9]+|[7-9])_M)|(60_([1-9][0-9]+|[7-9])_M))';echo 'exit='$? )
cat /usr/openv/netbackup/version | egrep 'NetBackup ((6\.[05])|(5\..*))' && ls /usr/openv/pack/pack.summary && ( cat /usr/openv/pack/pack.summary | egrep 'NB(_|(_(CLT|JAV)_))((6\.5\.((3\.(([1-9][0-9]+|[1-9])(\..*)?))|(([1-9][0-9]+|([4-9]))(\..*)?)))|(60_(((([1-9][0-9]+)|[89])(S[0-9]+)?)|(7S[0-9]+))_M))';echo 'exit='$? )
cat /usr/openv/patch/patch.history
( cat /var/qmail/man/cat*/qmail.* | grep -Ei "netqmail.*version" ) || ( echo `man -Ww qmail` | grep -E "\.gz$" && gzip -dc `man -Ww qmail` 2>/dev/null | grep -Ei "netqmail.*version" )
( cat /var/qmail/man/cat*/qmail.* | grep -Ei "[^t]qmail.*version" ) || ( echo `man -Ww qmail` | grep -E "\.gz$" && gzip -dc `man -Ww qmail` 2>/dev/null | grep -Ei "[^t]qmail.*version" )
clamscan --version
db2ls || /usr/local/bin/db2ls
dhcpd --version
dsmtca
echo '*******'; cat /etc/mandrake-release 2>/dev/null;echo '*******'; cat /etc/SuSE-release 2>/dev/null;echo '*******'; cat /etc/redhat-release 2>/dev/null;echo '*******'; cat /etc/slackware-version 2>/dev/null;echo '*******'; cat /etc/immunix-release 2>/dev/null;echo '*******'; cat /etc/turbolinux-release 2>/dev/null;echo '*******'; cat /etc/msclinux-release 2>/dev/null;echo '*******'; cat /etc/lanthan-release 2>/dev/null;echo '*******'; cat /etc/yellowdog-release 2>/dev/null;echo '*******'; cat /etc/coherent-release 2>/dev/null;echo '*******'; cat /etc/gentoo-release 2>/dev/null;echo '*******'; cat /etc/lsb-release 2>/dev/null;echo '*******'; cat /etc/debian_version 2>/dev/null;echo '*******'; cat /etc/issue 2>/dev/null;
echo '*******'; /sbin/ifconfig -a 2>/dev/null;echo '*******'; netstat -ina 2>/dev/null;echo '*******'; netstat -pn 2>/dev/null;echo '*******'; lanscan 2>/dev/null;
[ -e /opt/NA/UninstallerData/installvariables.properties ] && (cat /opt/NA/UninstallerData/installvariables.properties | grep -m 1 PRODUCT_VERSION)
evolution --version
( export|grep 'CAIGLBL0000' && ls $CAIGLBL0000/ino/config | egrep -c '^libarclib\.so(\.RO10729)?$' ) || ( ls -1 /usr/bin/ /opt/ | egrep -i '^(CA|caagent)$' && ls /usr/local/src/CA/ino/config | egrep -c '^libarclib\.so(\.RO10729)?$' )
find /etc /root /var/ssl -name "DigiNotar*.pem"
firefox -v
[ -f /opt/jabber/var/cache/xcp_vars.sh ] && cat /opt/jabber/var/cache/xcp_vars.sh
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._-]*" -a -name "libc[.-]*");do [ -r "$p" ] && grep -EHoai -m 1 "GNU C Library .*" "$p";done
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libcrypto.*");do [ -r "$p" ] && grep -qciE "CMS_Origina" "$p" && [ $(grep -ciE "CMS_[0-9_A-z]{3}" "$p") -gt 15 ] && grep -HaozE -m 1 "OpenSSL [0-9.]+[a-z]*" "$p";done
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libcrypto.*");do [ -r "$p" ] && grep -qciE "EVP_PKEY_verify_recover" "$p" && grep -HaozE -m 1 "OpenSSL [0-9.]+[a-z]*" "$p";done
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libsasl*");do [ -r "$p" ] && grep -qci "Cyrus SASL" "$p" && grep -HaozE -m 1 "((2\.([01]\.[0-9]+))|(1\.[0-9]+\.[0-9]+))" "$p";done
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libssl.*");do [ -r "$p" ] && grep -qac "SSL_renego" "$p" && grep -Eqac "OpenSSL 0\.[0-9]+" "$p" && grep -Hacoz -m 1 -E "^no renegotiation$" "$p";done
for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libxml2*");do [ -r "$p" ] && grep -qci "GLIBC_" "$p" && grep -Haic "xmlParseElementChildrenContentDecl : depth %d too deep" "$p";done
for p in $(find /usr/lib/apache/ /usr/lib/apache2/ /lib/apache/ /lib/apache2/ /usr/local/lib/apache/ /usr/local/lib/apache2/ /usr/lib/httpd/ /lib/httpd/ /usr/local/lib/httpd/ /opt/bea/ -type f ! -perm -o=w -name "mod_wl*.so" | egrep -v "[^/a-z.]+"); do [ -r "$p" ] && date -u +%Y-%m-%d -r "$p";done;
get ndp
gftp -v
google-chrome --version
grep : /etc/oratab 2>/dev/null | grep -ve "^#" | cut -d: -f2
( grep -E "VERSION[[:space:]]+=[[:space:]]+10" /etc/SuSE-release && grep -E "PATCHLEVEL[[:space:]]+=[[:space:]]+[0-2]" /etc/SuSE-release ) || uname -s -r
( grep -iq 'php -f' /etc/raddb/radiusd.conf ) && ( cat /guest/www/admin/includes/version.html )
grep "Load.*mod_proxy_ftp" /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/extra/httpd-ssl.conf /usr/local/apache2/conf/ssl.conf /etc/apache2/apache2.conf /etc/apache2/ports.conf /etc/httpd/conf/httpd.conf /etc/apache2/httpd.conf /usr/pkg/etc/httpd/httpd.conf /usr/local/etc/apache22/httpd.conf /usr/local/etc/apache2/httpd.conf /etc/httpd/httpd.conf /etc/httpd/extra/httpd-ssl.conf /etc/apache2/ssl-global.conf
if [ -d /opt/CA/igateway ]; then gw_loc="/opt/CA/igateway"; elif [ -d /opt/CA/SharedComponents/iTechnology ]; then gw_loc="/opt/CA/SharedComponents/iTechnology"; else gw_loc=""; fi; if [ "$gw_loc" != "" ]; then grep Version "$gw_loc/igateway.conf" | cut -d\< -f2 | cut -d\> -f2; fi;
if [ -e "/opt/OV/bin/ovstatus" -o -e "/var/opt/bin/ovstatus" ];then for p in $(find /usr/sbin/ /opt/OV/bin/ /var/opt/bin/ -type f ! -perm -o=w -name "snmpdm" | egrep -v "[^/a-z.]+");do [ -r "$p" ] && echo "$p" && date -u +%Y-%m-%d -r "$p";done;fi
if [ "$(uname -s)" == "Linux" -o "$(uname -s)" == "Darwin" ];then for p in $(find /usr/bin /usr/sbin /bin /sbin /usr/local/bin -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -iname 'cupsd');do [ -r "$p" ] && grep -HEao "CUPS/([0-9]+\.){2}[0-9.]+" "$p" | head -n 1;done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /usr/share/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a \( -name "logwatch" -o -name "logwatch.pl" \));do [ -r "$p" ] && grep -EHic "(Archive|ThisFile) has invalid embedded quotes" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libcrypto.*");do [ -r "$p" ] && grep -qc "ASN1_" "$p" && egrep -Hc "(bmp|universal)string is wrong length" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libpng*");do [ -r "$p" ] && grep -HEao -m 1 "libpng version [0-9]\..*" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libssl.*");do [ -r "$p" ] && ( grep -Haoz -m 1 -E "OpenSSL [0-9a-zA-Z.]+($|[^0-9a-zA-Z.])" "$p" || ( echo -n "$p "; date -u +%Y-%m-%d -r "$p" ) );done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libssl.*");do [ -r "$p" ] && grep -qac "KRB[0-9]-" "$p" && grep -qac "kssl.o" "$p" && grep -Haoz -m 1 -E "OpenSSL [0-9a-zA-Z.]+($|[^0-9a-zA-Z.])" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /lib /usr/lib/ /usr/local/lib/ /lib32 /usr/lib32/ /usr/local/lib32/ /lib64 /usr/lib64/ /usr/local/lib64/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "libssl.*");do [ -r "$p" ] && grep -qc " part of " "$p" && grep -Haoz -m 1 -E "OpenSSL [0-9a-zA-Z.]+($|[^0-9a-zA-Z.])" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /usr/bin /usr/sbin /bin /sbin /usr/local/bin -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -iname 'cupsd');do [ -r "$p" ] && grep -HEao "CUPS/([0-9]+\.){2}[0-9.]+" "$p" | head -n 1;done;fi
if [ "$(uname -s)" == "Linux" ];then for p in $(find /usr/lib /usr/share /usr/postgres /usr/bin /usr/sbin /bin /sbin /opt/postgres -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -iname "pg_ctl"); do [ -r "$p" ] && egrep -Hao "[(]?PostgreSQL[)]? [0-9.-]+([a-zA-Z]+)?" "$p";done;fi
if [ "$(uname -s)" == "Linux" ];then if [ -d "/opt/Symantec/SMSSMTP" ];then for p in $(find /opt/Symantec/SMSSMTP/bin/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "wp6sr.so");do [ -r "$p" ] && echo "$p" && date -u +%Y-%m-%d -r "$p";done;fi;fi
if [ "$(uname -s)" == "Linux" ];then if [ -d "/opt/Symantec/SMSSMTP" ];then for p in $(find /opt/Symantec/SMSSMTP/bin/ -type f ! -perm -o=w ! -name "*[^A-Za-z0-9._]*" -a -name "xlssr.so");do [ -r "$p" ] && echo "$p" && date -u +%Y-%m-%d -r "$p";done;fi;fi
java -fullversion
java -version
lpd -V
ls -1F /opt/IBM/ /opt/ibm/ /opt/IBM/WebSphere /opt/ibm/Websphere /opt/ibm/websphere | egrep -i '(ServiceRegistry|WSRR)'
ls -1F /usr/local/ | grep 'tgvault'
ls -1 /opt/CA/SharedComponents/tomcat/
ls -1 /opt/IBM/es/bin /opt/IBM/es/lib /usr/IBM/es/bin /usr/IBM/es/lib | grep -E "imcd.{2}\.flt"
( ( ls -1 /opt/sybase/ | grep -E "ASE-(1[0-4]|[0-9])[^0-9]" ) && echo "vulnerable_version" ) || ( ( /opt/sybase/ASE-15_0/bin/backupserver -v 2>&1| grep -Ei "Backup Server[^0-9]*15\.[0-5]" ) && ( /opt/sybase/ASE-15_0/bin/backupserver -v 2>&1| grep -Ei "EBF[^0-9*](1854[0125-8]|186(18|2[02468]|3[0268]|4[0246]|5[1236789]|6[1-6])|188(39|4[02-79])|190(19|2[0134]|9[5-9])|191(0[1-5]|1[4-7]|7[89]|8[01])|192(1[89]|2[03-6]|4[012456]|6[0124-7]))($|[^0-9])" || echo "vulnerable_missing_patch" ) )
( ( ls -1 /opt/sybase/ | grep -E "ASE-(1[0-4]|[0-9])[^0-9]" ) && echo "vulnerable_version" ) || ( ( /opt/sybase/ASE-15_0/bin/monserver -v 2>&1| grep -Ei "Monitor Server[^0-9]*15\.[0-5]" ) && ( /opt/sybase/ASE-15_0/bin/monserver -v 2>&1| grep -Ei "EBF[^0-9*](1854[0125-8]|186(18|2[02468]|3[0268]|4[0246]|5[1236789]|6[1-6])|188(39|4[02-79])|190(19|2[0134]|9[5-9])|191(0[1-5]|1[4-7]|7[89]|8[01])|192(1[89]|2[03-6]|4[012456]|6[0124-7]))($|[^0-9])" || echo "vulnerable_missing_patch" ) )
( ls /etc | grep -i "vmware-tools" ) || ( ( dmidecode --type baseboard | grep -i "intel" || cat /proc/acpi/fadt | grep -i "intel" ) && cat /proc/cpuinfo | tr -d '\n' )
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 6\.06(\.[0-9])?( LTS)?' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | egrep 'bz2|bzip2'
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 6\.06(\.[0-9])?( LTS)?' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | grep libxml2
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 6\.10(\.[0-9])' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | egrep 'bz2|bzip2'
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 7\.04(\.[0-9])' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | egrep 'bz2|bzip2'
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 7\.10(\.[0-9])?' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | egrep 'bz2|bzip2'
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 7\.10(\.[0-9])' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | grep libxml2
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 8\.04(\.[0-9])?( LTS)?' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | grep libxml2
ls /etc | grep lsb-release && cat /etc/lsb-release | egrep 'Ubuntu 8\.10(\.[0-9])' && dpkg -l | awk -F' ' '{ print $2 "_" $3 }' | grep libxml2
ls /etc/SuSE-release || uname -s -r
ls / | grep -i tandberg && grep -ic 'function genCookie' /tandberg/web/lib/secure.php /tandberg/web/user/lib/secure.php
ls / |grep -i tandberg &&( p="/tandberg/sshkeys";q="ssh_host_dsa_key";f="$p/$q.pub $p/$q";for x in $f;do if [ -e $x ];then if [ -r $x ];then echo -n "$x:";ssh-keygen -l -f $x |grep -ic '49:53:bf:94:2a:d7:0c:3f:48:29:f7:5b:5d:de:89:b8';else echo "$x:VERIFY";fi;fi;done;unset f p q )
ls /opt | grep 'casp' && cat /opt/casp/VERSION
ls /opt/ | grep 'coldfusion8' && date -u +%Y-%m-%d -r /opt/coldfusion8/runtime/lib/wsconfig.jar
ls /opt/ | grep 'coldfusion8' && date -u +%Y-%m-%d -r /opt/coldfusion8/wwwroot/CFIDE/administrator/Application.cfm
ls /opt/ | grep 'coldfusion8' && date -u +%Y-%m-%d -r /opt/coldfusion8/wwwroot/CFIDE/administrator/index.cfm
ls /opt/ | grep 'coldfusion8' && date -u +%Y-%m-%d -r /opt/coldfusion8/wwwroot/CFIDE/debug/cf_debugFr.cfm
ls /opt/ | grep 'coldfusion8' && date -u +%Y-%m-%d -r /opt/coldfusion8/wwwroot/CFIDE/wizards/common/_logintowizard.cfm
ls /opt/ | grep 'coldfusion8' && ls -l /opt/coldfusion8/lib/updates | egrep -c 'hf80[01]-1875\.jar'
ls /opt/ | grep 'coldfusion8' && ls -l /opt/coldfusion8/lib/updates | egrep -c 'hf80[01]-1878\.jar'
ls /opt/ | grep 'coldfusionmx7' && date -u +%Y-%m-%d -r /opt/coldfusionmx7/runtime/lib/wsconfig.jar
ls /opt/ | grep 'coldfusionmx7' && date -u +%Y-%m-%d -r /opt/coldfusionmx7/wwwroot/CFIDE/administrator/Application.cfm
ls /opt/ | grep 'coldfusionmx7' && date -u +%Y-%m-%d -r /opt/coldfusionmx7/wwwroot/CFIDE/administrator/index.cfm
ls /opt/ | grep 'coldfusionmx7' && date -u +%Y-%m-%d -r /opt/coldfusionmx7/wwwroot/CFIDE/debug/cf_debugFr.cfm
ls /opt/ | grep 'coldfusionmx7' && date -u +%Y-%m-%d -r /opt/coldfusionmx7/wwwroot/CFIDE/wizards/common/_logintowizard.cfm
ls /opt/ | grep 'coldfusionmx7' && ls -l /opt/coldfusionmx7/lib/updates | egrep -c 'hf702-1875.jar'
ls /opt/ | grep 'coldfusionmx7' && ls -l /opt/coldfusionmx7/lib/updates | egrep -c 'hf702-1878\.jar'
ls /opt/ | grep 'jrun4' && date -u +%Y-%m-%d -r /opt/jrun4/servers/admin/jmc-app.ear
ls /opt | grep -q 'coldfusion' && (date -u +%Y-%m-%d -r /opt/coldfusion*/wwwroot/CFIDE/administrator/Application.cfm)
ls /opt | grep -q 'coldfusion' && (date -u +%Y-%m-%d -r /opt/coldfusion*/wwwroot/CFIDE/administrator/cftags/l10n.cfm)
ls /opt | grep -q 'coldfusion' && (date -u +%Y-%m-%d -r /opt/coldfusion*/wwwroot/CFIDE/administrator/login.cfm)
ls /opt | grep VRTSralus && strings /opt/VRTSralus/bin/beremote | grep Version
ls /opt/ | grep 'xensource' && ls /opt/xensource/bin/ | grep 'xapi' && which xe && xe patch-list uuid=B7616953-53E2-414E-B93A-EE817AC8655A
ls /opt/ | grep 'xensource' && which xe && xe patch-list | egrep -c '(b998f898-2705-4f38-b4d2-781a518495b5)|(ead29a11-9dcd-47ec-b82d-da73516fb38b)|(bea3d0f0-07d4-476a-87f3-8aafc08a316f)|(12fef4b1-c2ad-4252-bbe8-a604604a6bfb)|(548573d0-744c-4d58-98cb-34561acf2b38)'
ls /opt/IBM/ | grep 'db2cmv8' && ls /opt/IBM/db2cmv8/bin && ls /opt/IBM/db2cmv8/fixpack/cm/ | egrep -c '8.4.0*1.100'
ls /opt/IBM/ | grep 'db2cmv8' && ls /opt/IBM/db2cmv8/bin && ls /opt/IBM/db2cmv8/fixpack/cm/ | egrep -c '8\.4\.((0*1\.([12]?[0-9]?[0-9]))|(0+\..*))'
(ls /opt /opt/sun|egrep '^(sun|SUNWwbsvr)$')&&a=$(find /opt/SUNWwbsvr/ /opt/sun/webserver/ -user root -type d ! -perm -o=w -name "https-*" | head -n1);b=$(find /opt/SUNWwbsvr/ /opt/sun/webserver/ -user webservd -type d ! -perm -o=w -name "https-*" | head -n1); ( test "$a"&&("$a"/start -version) ) || (test "$b"&&("$b"/start -version))
ls /opt/Symantec/ | grep 'SMSSMTP' && strings /opt/Symantec/SMSSMTP/mta/bin/filter-hub | grep bmi_version
\ls -q1R /usr/bin/ /usr/local/bin/ /opt/ | grep "teamviewer"
( ls /sun | egrep '^webserver7$' && /sun/webserver7/bin/wadm --version ) || ( ls /opt/sun | egrep '^sun-webserver7$' && /opt/sun/sun-webserver7/bin/wadm --version ) || ( ls /opt/sun | egrep '^webserver7$' && /opt/sun/webserver7/bin/wadm --version )
ls /usr/adm/best1_6.5/ | grep 'Authorization.cfg'&&echo ' '
ls /usr/Adobe/ /opt/Adobe/ /usr/lpp/Adobe/
ls /usr/java/ /usr/jdk/ /usr/sdk/
ls /usr/java/ /usr/jdk/ /usr/sdk/ /usr/jdk/instances/ /usr/sdk/instances/
ls /usr/lib/xine/ && ls /usr/lib/xine/plugins/
( ls /usr/local/bin/ | egrep 'net-snmp-config' && /usr/local/bin/net-snmp-config --version ) || ( which net-snmp-config && net-snmp-config --version )
( ( ls /usr/local/krb/bin/krb5kdc && /usr/local/krb/bin/krb5-config --version ) || (  ls /usr/kerberos/bin/krb5kdc && /usr/kerberos/bin/krb5-config --version ) || ( which krb5kdc && krb5-config --version ) )
mc --version
mozilla -v
mysql -V
mysql --version
nslookup localhost
ntpd -v
ntpq -v
openssl version
/opt/cisco/hostscan/bin/ciscod -v
/opt/cisco/vpn/bin/vpn -v | grep -i "Cisco AnyConnect Secure Mobility Client"
/opt/CSCOpx/lib/jre/bin/java -version
/opt/ibm/db2/bin/db2daslevel || /opt/IBM/db2/bin/db2daslevel || db2daslevel || db2level
/opt/IBM/db2/bin/db2level || db2level || /usr/local/bin/db2ls
( /opt/OV/bin/ovnnmversion -v || /opt/ov/bin/ovnnmversion -v || /var/opt/bin/ovnnmversion -v ) | egrep '7\.53' && ( date -u +%Y-%m-%d -r /opt/OV/www/cgi-bin/nnmRptConfig.exe || date -u +%Y-%m-%d -r /opt/ov/www/cgi-bin/nnmRptConfig.exe )
/opt/SUNWvda/sbin/vda -V
/opt/Symantec/SMSSMTP/bin/filter-hub -v
/opt/VRTSob/bin/vxsvc -v
php -v;stty -echo
pidgin -v
rails -v
rpm -qa
( rpm -qa || dpkg -l || pkginfo || lslpp -L || pkg_info -a || swlist -l product @localhost || cat /usr/lib/openoffice/program/versionrc ) | grep -Ei "(((SUNW)?star(office|suite)([_-].*)?)|(BuildVersion=ooo-build [0-9.]+))"
( rpm -qa || dpkg -l || pkginfo || lslpp -L || pkg_info -a || swlist -l product @localhost ) | grep -Ec "((SUNW)?star(office|suite)([_-].*)?)"; which openoffice && openoffice --version
( ( rpm -qa || dpkg -l || pkginfo || lslpp -L || pkg_info -a || swlist -l product @localhost ) | grep -Ec "((SUNW)?star(office|suite)([_-].*)?)" ) || ( which soffice && soffice -help | grep OpenOffice\.org ) || ( which ooffice && ooffice -help | grep OpenOffice\.org )
rpm -qa | grep 'juniper-branding' && [ -d /opt/qradar ] && rpm -qa | grep -c qradar && cat /etc/.product_name
/sbin/dhclient -V
/sbin/dhclient --version || /sbin/dhclient3 --version
seamonkey -v
sgepasswd -help || sgepasswd --help
show application version ise
show /HOST
show microcode
show modules
SHOW OA INFO
show packages active cm
show packages active cup
show system
show system boot-messages
show version
show version active
smbclient -V
smbd -V
snort -V
spamc -V
sqlsrvr -v
ssh-broker-g3 -V
sudo -V | grep -i 'sudo version'
test -d /opt/ibm/db2 && echo installed
test -e /etc/adobe/fms/services/fms && strings `cat /etc/adobe/fms/services/fms`/fmscore | grep -Eo "[0-4],[0-9]+,[0-9]+,[0-9]+"
test -e /opt/coldfusion8 && ( (ls /opt/coldfusion8/lib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[3-9])\.jar" || ls /opt/coldfusion8/WEB-INF/cfusionlib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[3-9])\.jar" ) || echo vulnerable )
test -e /opt/coldfusion8 && ( (ls /opt/coldfusion8/lib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[4-9])\.jar" || ls /opt/coldfusion8/WEB-INF/cfusionlib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[4-9])\.jar" ) || echo vulnerable )
test -e /opt/coldfusion8 && ( (ls /opt/coldfusion8/lib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[5-9])\.jar" || ls /opt/coldfusion8/WEB-INF/cfusionlib/updates | grep -Ei "hf80[01]-000([1-9][0-9]|0[5-9])\.jar" ) || echo vulnerable )
test -e /opt/coldfusion9 && ( (ls /opt/coldfusion9/lib/updates | grep -Ei "hf900-000([1-9][0-9]|0[4-9])\.jar" || ls /opt/coldfusion9/WEB-INF/cfusionlib/updates | grep -Ei "hf900-000([1-9][0-9]|0[4-9])\.jar" || ls /opt/coldfusion9/lib/updates | grep -Ei "hf901-000([1-9][0-9]|0[3-9])\.jar" || ls /opt/coldfusion9/WEB-INF/cfusionlib/updates | grep -Ei "hf901-000([1-9][0-9]|0[3-9])\.jar") || echo vulnerable )
test -e /opt/coldfusion9 && ( (ls /opt/coldfusion9/lib/updates | grep -Ei "hf900-000([1-9][0-9]|0[5-9])\.jar" || ls /opt/coldfusion9/WEB-INF/cfusionlib/updates | grep -Ei "hf900-000([1-9][0-9]|0[5-9])\.jar" || ls /opt/coldfusion9/lib/updates | grep -Ei "hf901-000([1-9][0-9]|0[4-9])\.jar" || ls /opt/coldfusion9/WEB-INF/cfusionlib/updates | grep -Ei "hf901-000([1-9][0-9]|0[4-9])\.jar") || echo vulnerable )
test -e /opt/coldfusion9 && ( (ls /opt/coldfusion9/lib/updates | grep -Ei "hf90[01]-000([1-9][0-9]|0[3-9])\.jar" || ls /opt/coldfusion9/WEB-INF/cfusionlib/updates | grep -Ei "hf90[01]-000([1-9][0-9]|0[3-9])\.jar" ) || echo vulnerable )
test -f /opt/IBM/FIM/plugins/com.tivoli.am.fim.protocols_6.2.0.0.jar && date +%F -r /opt/IBM/FIM/plugins/com.tivoli.am.fim.protocols_6.2.0.0.jar; test -f /opt/IBM/FIM/com.tivoli.am.fim.samlsso_1.0/itfim-samlsso.jar && date +%F -r /opt/IBM/FIM/com.tivoli.am.fim.samlsso_1.0/itfim-samlsso.jar
test -f /usr/nsm/VERSION && echo "Installed"
thunderbird -v
tor --version
uname -a|grep 'Linux'&&( u=$(ls -1d /home/*);u="$u /root /usr/lib";for a in $u;do [ -r "$a"/ICAClient/npica.so ]&&grep -HEoa -m 1 'Version [0-9.]+' "$a/ICAClient/npica.so";done;unset u )
uname | egrep -i "(HP-?UX|Linux|SunOS)" && (/opt/OV/bin/ovnnmversion -v || /opt/ov/bin/ovnnmversion -v || /var/opt/bin/ovnnmversion -v) | egrep -o '7\.5[0-9]+' && ls /opt/OV/patches/ /var/opt/OV/patches/ /opt/ov/patches/ /var/opt/ov/patches/ | egrep -c '((PHSS_4070[78])|(LXOV_0010[34])|(PSOV_03527))'
uname | egrep -i "(HP-?UX|Linux|SunOS)" && (/opt/OV/bin/ovnnmversion -v || /opt/ov/bin/ovnnmversion -v || /var/opt/bin/ovnnmversion -v) | egrep -o '7\.5[13]' && ls /opt/OV/patches/ /var/opt/OV/patches/ /opt/ov/patches/ /var/opt/ov/patches/ | egrep -c '((PHSS_4160[67])|(LXOV_0011[34])|(PSOV_03531))'
uname | egrep -i "(HP-?UX|Linux|SunOS)" && (/opt/OV/bin/ovnnmversion -v || /opt/ov/bin/ovnnmversion -v || /var/opt/bin/ovnnmversion -v) | egrep -o '7\.5[13]' && ls /opt/OV/patches/ /var/opt/OV/patches/ /opt/ov/patches/ /var/opt/ov/patches/ | egrep -c '((PHSS_4223[23])|(LXOV_0012[12])|(PSOV_03535))'
uname | egrep 'Linux' && ls /opt/OV/bin/ /opt/ov/bin/ /var/opt/bin/ | grep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/ /opt/ov/patches/ /var/opt/ov/patches/ | egrep -c 'LXOV_0010[34]'
uname | egrep 'Linux' && ls /opt/OV/bin/ /var/opt/bin/ | egrep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/  | egrep -c 'LXOV_00087|LXOV_00088'
uname | egrep 'Linux' && ls /opt/OV/bin/ /var/opt/bin/ | egrep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/  | egrep -c 'LXOV_00090|LXOV_00089'
uname | egrep 'Linux' && ls /opt/OV/bin/ /var/opt/bin/ | egrep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/  | egrep -c 'LXOV_00093|LXOV_00094'
uname | egrep 'Linux' && ls /opt/OV/bin/ /var/opt/bin/ | grep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/  | egrep -c 'LXOV_00101|LXOV_00102'
uname | egrep 'Linux' && ls /opt/OV/bin/ /var/opt/bin/ | grep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/  | egrep -c 'NNM810L_00006'
uname | egrep 'Linux' && ( /opt/OV/bin/ovnnmversion -v || /opt/ov/bin/ovnnmversion -v || /var/opt/bin/ovnnmversion -v ); ( uname | egrep 'Linux' && ls /opt/OV/bin/ /opt/ov/bin/ /var/opt/bin/ | grep 'ovstatus' && ls /opt/OV/patches/ /var/opt/OV/patches/ /opt/ov/patches/ /var/opt/ov/patches/  | egrep -c 'LXOV_0010[34]' )
uname | egrep 'Linux' && rpm -qa | egrep -i 'sun-identity'
( uname | grep 'Linux' && ls -1RF /usr/local/SUNWappserver/domains /opt/SUNWappserver/domains 2> /dev/null | grep -E 'opensso' ) || echo OpenSSO not installed
uname | grep 'Linux' && ls /opt/ | grep 'CSCOcsa' && rpm -qf /opt/CSCOcsa/bin/ciscosecd
uname -m | grep '64' && which httpd && httpd -t -D DUMP_MODULES | egrep '(proxy_module|mod_proxy)' && httpd -v
uname -s | grep 'Linux' && java -version
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3\.1_25' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3\.1_26' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3\.1_27' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.3'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(2[2-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(2[4-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(2[6-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(2[89]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_[2-9][0-9]' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(3[2-9]|[4-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_(3[4-9]|[4-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4\.2_([3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.4'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(1[89]|[2-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(2[2-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(2[4-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(2[6-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(2[8-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_[2-9][0-9]' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_(3[2-9]|[4-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5\.0_([3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.5'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(1[3-9]|[2-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(1[5-9]|[2-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(1[7-9]|[2-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(2[2-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(2[4-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(2[6-9]|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_[2-9][0-9]' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6\.0_(29|[3-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.6'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk((1\.6)|(1\.5)|(1\.4))'
uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.7\.0_(0[1-9]|[1-9][0-9])' && echo 'patched' || uname -s | grep 'Linux' && ls /usr/java/ | egrep -i '[sj]dk1\.7'
uname -s | grep 'SunOS' || ( ( ls /usr/local/krb/bin/krb5kdc && /usr/local/krb/bin/krb5-config --version ) || (  ls /usr/kerberos/bin/krb5kdc && /usr/kerberos/bin/krb5-config --version ) || ( which krb5kdc && krb5-config --version ) )
uname -s | grep 'SunOS' || ( /usr/local/krb/bin/krb5-config --version || /usr/kerberos/bin/krb5-config --version || krb5-config --version )
uname -s -r
/usr/Adobe/Acrobat7.0/bin/acroread -version || /opt/Adobe/Acrobat7.0/bin/acroread -version || /usr/lpp/Adobe/Acrobat7.0/bin/acroread -version
/usr/Adobe/Reader8/bin/acroread -version || /opt/Adobe/Reader8/bin/acroread -version || /usr/lpp/Adobe/Reader8/bin/acroread -version
( /usr/Adobe/Reader8/bin/acroread -version || /opt/Adobe/Reader8/bin/acroread -version || /usr/lpp/Adobe/Reader8/bin/acroread -version ) || ( /usr/Adobe/Reader9/bin/acroread -version || /opt/Adobe/Reader9/bin/acroread -version || /usr/lpp/Adobe/Reader9/bin/acroread -version )
/usr/Adobe/Reader9/bin/acroread -version || /opt/Adobe/Reader9/bin/acroread -version || /usr/lpp/Adobe/Reader9/bin/acroread -version
/usr/bin/acroread -version
/usr/kerberos/bin/krb5-config
/usr/kerberos/bin/krb5-config --version
/usr/local/bin/db2ls -c
/usr/local/bin/db2ls || db2level
( /usr/local/krb/bin/krb5-config --version || /usr/kerberos/bin/krb5-config --version || krb5-config --version )
/usr/local/SUNWappserver/domains/opensso/tools/bin/ssoadm --version || /opt/SUNWappserver/domains/opensso/tools/bin/ssoadm --version || /opt/opensso/tools/bin/ssoadm --version || /usr/local/opensso/tools/bin/ssoadm --version || /opensso/tools/bin/ssoadm --version
vamicli version --studio
version
virtualbox -h | grep -Ei "Oracle VM VirtualBox Manager"
( vmware -v | grep -Eq "ESX 4\.0.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-5][0-9]{4}|60([01][0-9]{2}|2([0-2][0-9]|3[0-5])))))") && ( ( esxupdate query | grep -q "ESX400-201103401-SG" && esxupdate query | grep -q "ESX400-201103404-SG" && esxupdate query | grep -q "ESX400-201103406-SG" && esxupdate query | grep -q "ESX400-201103407-SG" ) || ( echo "unpatched_ESX400-201103401-SG_ESX400-201103404-SG_ESX400-201103406-SG_ESX400-201103407-SG" ) )
( vmware -v | grep -Eq "ESX 4\.1.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-3][0-9]{4}|4([0-7][0-9]{3}|8([0-3][0-9]{2}|4([0-7][0-9]|80))))))") && ( ( esxupdate query | grep -q "ESX410-201101201-SG" && esxupdate query | grep -q "ESX410-201104407-SG" ) || ( echo "unpatched_ESX410-201101201-SG_ESX410-201104407-SG" ) )
( vmware -v | grep -Eq "ESXi 4\.0.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-5][0-9]{4}|60([01][0-9]{2}|2([0-2][0-9]|3[0-5])))))") && ( ( esxupdate query | grep -q "ESXi400-201103401-SG") || ( echo "unpatched_ESXi400-201103401-SG" ) )
( vmware -v | grep -Eq "ESX(i)? 4\.0.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-8][0-9]{4}|9([0-7][0-9]{3}|8([0-2][0-9]{2}|3([0-3][0-9]|4[0-7]))))))($|[^0-9])" ) && ( ( esxupdate query | grep -Eq "ESX(i)?400-20110340[12]-SG") || ( echo "unpatched_ESX400-201103401-SG_ESXi400-201103402-SG" ) )
( vmware -v | grep -Eq "ESXi 4\.1.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-3][0-9]{4}|4([0-7][0-9]{3}|8([0-3][0-9]{2}|4([0-7][0-9]|80))))))") && ( ( esxupdate query | grep -q "ESXi410-201101201-SG") || ( echo "unpatched_ESXi410-201101201-SG" ) )
( ( vmware -v | grep -Eq "ESX(i)? 4\.1.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-7][0-9]{4}|8(0[0-9]{3}|1([0-4][0-9]{2}|5([0-8][0-9]|90))))))($|[^0-9])" ) || ( vmware -v | grep -Eq "ESX(i)? 4\.0.*build-(([12]?[0-9]?[0-9]?[0-9]?[0-9]?[0-9]|3([0-8][0-9]{4}|9([01][0-9]{3}|2([0-8][0-9]{2}|9[0-8][0-9])))))($|[^0-9])" ) ) && ( ( esxupdate query | grep -Eq "ESX(i)?4[10]0-201104401-SG") || ( echo "unpatched_201104401" ) )
( vmware -v | grep -Eq "ESX(i)? 4\.1" ) && ( ( esxupdate query | grep -Eq "ESX(i)?[^uU]*[Uu]pdate(0)?1") || ( echo "unpatched_Update1" ) )
v=`uname`;x=0;if [ $v == "Linux" ];then which rpm&&x=`rpm -qa|egrep -c '(kvm|kmod-kvm|^kvm)-'`;which dpkg&&x=`dpkg -l|egrep -c ' (kvm|kmod)'`;which equery&&x=`equery list|egrep -c '(kvm|kmod)-'`;else x=-1;fi;if [ $x -gt 0 ];then uname -s -r;fi
which asterisk && asterisk -V
which clamscan && clamscan --version
which etherape && etherape --version
which ffmpeg && ffmpeg -version
which firefox && firefox -v
which firefox && firefox -v; which seamonkey && seamonkey -v
which firefox && firefox -v; which seamonkey && seamonkey -v; which thunderbird && thunderbird -v
which firefox && firefox -v; which thunderbird && thunderbird -v
which firefox && firefox -v; which thunderbird && thunderbird -v; which seamonkey && seamonkey -v
which git && git --version
( which gnutls-cli && gnutls-cli --version ) || ( which gnutls-serv && gnutls-serv --version ) || ( which libgnutls-config && libgnutls-config --version )
which httpd && httpd -v
which lsb_release && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' | egrep "Ubuntu 6\.06(\.[0-9])?( LTS)?" && dpkg -l | awk -F' ' '{ print $2 "_" $3 }'
which lsb_release && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' | egrep "Ubuntu 6\.10" && dpkg -l | awk -F' ' '{ print $2 "_" $3 }'
which lsb_release && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' | egrep "Ubuntu 7\.04" && dpkg -l | awk -F' ' '{ print $2 "_" $3 }'
which lsb_release && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' | egrep "Ubuntu 7\.10" && dpkg -l | awk -F' ' '{ print $2 "_" $3 }'
which lsb_release && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' && lsb_release -d | awk -F' ' '{ print $2 " " $3 }' | egrep "Ubuntu 8\.04(\.[0-9])?( LTS)?" && dpkg -l | awk -F' ' '{ print $2 "_" $3 }'
which mutt | grep -c "/mutt"
which ndp
which openoffice && echo -n "OpenOffice " && openoffice --version | egrep -o '[0-9]\..+'
which php && php -v;stty -echo
(which rpm)&&(rpm -qa)
which rpm && rpm -qa | egrep 'LinuxShield-1\.5\.[01]' && cat /opt/NAI/LinuxShield/etc/HF-Version && grep -Hc 'HF550192' /opt/NAI/LinuxShield/etc/HF-Version
(which rpm)&&(rpm -qa | grep sun)
which seamonkey && seamonkey -v
which shar && shar --version
which slapd && slapd -V
which snmpd && snmpd -v
which snort && snort -V
which spamdyke && spamdyke -v
which sshd && ssh -v
which swat && swat --version
which thunderbird && thunderbird -v
which tiff2pdf && tiff2pdf
which TokenConverter && TokenConverter
which tor && tor --version
which vlc && vlc --version
which xine-config && xine-config --version
wireshark -v || ethereal -v
xe patch-list name-label="Hotfix 3 for XenServer 4.1.0"
xe patch-list name-label="Hotfix 7 for XenServer 4.0.1" uuid=e80a2309-a6f1-74ef-63c8-1586e97d805e
