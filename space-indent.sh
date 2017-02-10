#!/bin/sh
is_number() {
    # return $?   0 -> true
    [ "$1" -eq "$1" ] 2>/dev/null
}

SPNUM=4
_last=${!#}

for arg in $@; do
    args+=($arg)
done

if [ -n "$1" ] && is_number $1 ; then
    SPNUM=$[$1]
else
    args+=("null")
fi

echo "Number => $SPNUM"

while [ $SPNUM -gt 0 ]; do
    STR+=" "
    SPNUM=$[$SPNUM-1]
done

tab=$'\t'

sed -i '' -e "s/$tab/$STR/g" "${args[@]}"
