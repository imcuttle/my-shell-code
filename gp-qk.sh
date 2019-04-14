#!/bin/sh


if [ -z "$1" ] ;then
    _commit=""
else
    _commit=$1
fi
branch=$(git rev-parse --abbrev-ref HEAD)
git add .
git commit -m "$_commit"

if [ -z "$2" ] ;then
    git push --tags origin "$branch"
else
    git push --tags $2 "$branch"
fi
