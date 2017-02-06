#!/bin/sh

DELDIR="/.Trashes"
[ ! -d $DELDIR ] && mkdir $DELDIR

mv -vi $@ $DELDIR
