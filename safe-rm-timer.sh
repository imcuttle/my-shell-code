#!/bin/sh

LOCKFILE="/tmp/safe-rm-timer.lock"
DELDIR="/.Trashes"
[ -f $LOCKFILE ] && echo "Already running $(basename $0)" >&2 && exit

do_for_sigint() {
    rm $LOCKFILE
    exit
}

trap "do_for_sigint" INT

echo $$ > $LOCKFILE
secs=$[60*10]
# endTime=$(( $(date +%s) + secs ))
while [ 1 ]; do 
    echo rm "$DELDIR/*"
    /bin/rm -rfv "$DELDIR/*"
    sleep $secs
done



# todo something
# rm $LOCKFILE