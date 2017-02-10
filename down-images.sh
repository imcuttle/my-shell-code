#!/bin/bash
# download bash script: http://xoimg.com/
# Usage: ./down-image.sh <begin_id> <date>
# eg. ./down-image.sh 54910 20170205
# result: save images to directory ./images.
# 
# curl https://raw.githubusercontent.com/moyuyc/my-shell-code/master/down-images.sh > down-image.sh && sh down-image.sh 54910 20170205

DATE=$(date +%Y%m%d)
[ -n "$2" ] && DATE=$2

TMP=${DATE:4}

[ "${TMP:0:1}" -eq "0" ] && TMP="${TMP:1}0";


BASE_URL="http://xoimg.com/upload/image/"$DATE/$TMP"00"

down() {
    local URL=$1
    local Name=$2
    local data=`curl --fail --silent $URL` 
    # "$data" 不能少  因为data中可能包含[]
    if [ ! -z "$data" ]; then
        curl --fail --silent $URL -o $Name
        # echo $data>$Name
        echo "DOWNLOADED! $URL"
        return 0 # true
    else
        echo "NOT FOUND! $URL"
        return 1 # false
    fi
}

mkdir_check() {
    [ ! -d "$1" ] && mkdir $1;
}

DIR="images"
mkdir_check $DIR

i=0
[ -n "$1" ] && i=$1
exts=(".jpg" ".png" ".gif")

while [ "$i" -le 99999 ]; do
    INNERDIR="$DIR/$DATE"
    mkdir_check $INNERDIR



    for ext in ${exts[@]}; do
        FILENAME="$(printf %05d $i)$ext"
        
        if [ ! -f "$INNERDIR/$FILENAME" ]; then
            if down "$BASE_URL$FILENAME" "$INNERDIR/$FILENAME" ; then
                break;
            fi
        else
            echo "EXISTED! $INNERDIR/$FILENAME"
            break;
        fi
    done
    
    i=$[i+1];
done