#!/bin/sh
# scriptname [...files] [from space number] [to space number]
# bug:
#    only match first indent of each line.


is_number() {
    # return $?   0 -> true
    [ "$1" -eq "$1" ] 2>/dev/null
}

repeat() {
    local NUM=$2
    local STR=""
    while [ $NUM -gt 0 ]; do
        STR+="$1"
        NUM=$[$NUM-1]
    done
    return_val="$STR"
}
return_val=""
SPNUM=4
_last=${!#}
second_to_last="${@:(-2):1}"

for arg in $@; do
    args+=($arg)
done

if [ -n "$_last" ] && is_number $_last ; then
    SPNUM=$[$_last]
else
    args+=("null")
fi

repeat " " "$SPNUM"
STR=$return_val
echo "To Space Number => $SPNUM"
unset "args[${#args[@]}-1]"

if [ -n "$second_to_last" ] && is_number $second_to_last ; then
    unset "args[${#args[@]}-1]"
    echo "FROM Space Number => $second_to_last"
    repeat " " $second_to_last
    FROM=$return_val
    sed -i '' -e "s/^$FROM/$STR/g" "${args[@]}"
fi

tab=$'\t'
sed -i '' -e "s/^$tab/$STR/g" "${args[@]}"


