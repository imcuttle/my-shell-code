#!/bin/sh

DELDIR="$HOME/.Trash"
[ ! -d $DELDIR ] && mkdir $DELDIR

mv -vi $@ $DELDIR
