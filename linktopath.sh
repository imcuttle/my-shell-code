#!/bin/sh


if [ -z "$1" ] ;then
    echo "please input source file."
else

    for file in $@; do
        chmod +x $file
        base=${file##*/}
        ln -f "$file" /usr/local/bin/${base%\.sh}
        echo ln -f "$file" /usr/local/bin/${base%\.sh}
    done
    
fi