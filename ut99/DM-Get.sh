#!/bin/sh

BASE_URL="http://www.unrealplayground.com/forums/downloads.php"
PAGE_URL="?do=cat&id=26&sort=downloads&page="

PAGE_NUMS="2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47"
#PAGE_NUMS="1"

for page_num in ${PAGE_NUMS}
do
    wget -O up.html ${BASE_URL}${PAGE_URL}${page_num}
    dl_links=`grep 'act=down' up.html | awk '{print $5}' | awk -F\" '{print $2}' | sed 's/\./http:\/\/www.unrealplayground.com\/forums/' | sed 's/amp;//g'`
    for dl_link in $dl_links
    do
        echo "$(date) downloading: ${dl_link}"
        firefox "$dl_link"
        sleep 35;
    done
done
