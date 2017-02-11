#!/bin/sh


if [ -z "$1" ] ;then
    echo "please input source file."
else

    for _file in $@; do
        _file="$PWD/$_file"
        chmod +x $_file
        base=${_file##*/}
        ln -sf "$_file" /usr/local/bin/${base%\.sh}
        echo ln -sf "$_file" /usr/local/bin/${base%\.sh}
    done
    
fi