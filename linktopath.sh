#! /bin/sh

if [ -z "$1" ] ;then
    echo "please input source file."
else
    base=${1##*/}
    ln -f "$1" /usr/local/bin/${base%\.sh}
    echo ln -f "$1" /usr/local/bin/${base%\.sh}
fi