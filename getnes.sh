#!/bin/sh

SITE="http://www.freeroms.com/"
SECTIONS="NUM B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
#SECTIONS="A"

function decode_url() {
svrlist=`grep server game.htm | grep roms | sed 's/;/\n/g'`
url=`grep '>Download<' game.htm | awk -F\' '{print $3}'`
for svr in $svrlist
do
    if [ `echo $svr | grep '[hz][ti][tp]' | wc -l` -gt 0 ]
    then
        target=`echo $svr | awk -F= '{print $1}'`
        sub=`echo $svr | awk -F\" '{print $2}' | sed 's/\//@/g'`
        echo "sub $target with $sub"
        url=`echo $url | sed "s/\+ $target /$sub/"`
        #echo "s/+ $target/$sub/"
    fi
done
url=`echo $url | sed 's/@/\//g' | sed 's/+//g'`
echo $url 
}

function get_game_html() {
echo "get page for game $game"
wget -O game.htm ${SITE}${game}
decode_url 
cd roms
wget $url
cd ..
rm game.htm
}

function get_games_html() {
for game in $GAMES
do
    get_game_html $game
done
}

for sec in $SECTIONS
do
   i=1
   wget -O section.htm ${SITE}nes_roms_${sec}.htm 
   GAMES=`grep Rate section.htm | awk '{print $4}' | grep href | awk -F\" '{print $2}'`
   get_games_html
   while [ `grep ${sec}${i} section.htm | wc -l` -gt 0 ]
   do
      rm section.htm
      wget -O section.htm ${SITE}nes_roms_${sec}${i}.htm 
      GAMES=`grep Rate section.htm | awk '{print $4}' | grep href | awk -F\" '{print $2}'`
      get_games_html $GAMES
      i=$((i + 1))
   done
   rm section.htm
done
