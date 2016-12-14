#! /bin/sh

if [ -z "$1" ] ;then
    commit="from bash"
else
    commit=$1
fi

git add .
git commit -am $commit
git push