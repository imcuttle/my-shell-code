#!/bin/sh


if [ -z "$1" ] ;then
    _commit="from bash"
else
    _commit=$1
fi

git add .
git commit -m "$_commit"

if [ -z "$2" ] ;then
    git push
else
    git push $2
fi
