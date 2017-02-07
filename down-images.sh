#!/bin/bash
# download bash script: http://xoimg.com/
# Usage: ./down-image.sh <begin_id> <date>
# eg. ./down-image.sh 54910 20170205
# result: save images to directory ./images.

DATE=$(date +%Y%m%d)
[ -n "$2" ] && DATE=$2

TMP=${DATE:4}

[ "${TMP:0:1}" -eq "0" ] && TMP="${TMP:1}0";


BASE_URL="http://xoimg.com/upload/image/"$DATE/$TMP"00"

down() {
    URL=$1
    Name=$2
    data=`curl --fail --silent $URL` 
    # "$data" 不能少  因为data中可能包含[]
    if [ ! -z "$data" ]; then
        curl --fail --silent $URL > $Name
        # echo $data>$Name
        echo "DOWNLOADED! $URL"
    else
        echo "NOT FOUND! $URL"
    fi
}

mkdir_check() {
    [ ! -d "$1" ] && mkdir $1;
}

DIR="images"
mkdir_check $DIR

i=0
[ -n "$1" ] && i=$1

while [ "$i" -le 99999 ]; do
    INNERDIR="$DIR/$DATE"
    mkdir_check $INNERDIR
    FILENAME="$(printf %05d $i).jpg"
    [ ! -f "$FILENAME" ] && down "$BASE_URL$FILENAME" "$INNERDIR/$FILENAME" || echo "EXISTED! $URL"
    i=$[i+1];
done