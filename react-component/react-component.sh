#! /bin/sh

is_directory()
{
  DIR_NAME=$1
  if [ ! -d $DIR_NAME ]; then
    return 1
  else
    return 0
  fi
}

_PATH="/Users/moyu/my-code/ShellCode/react-component"
# echo $PATH
# echo 

if [ -z "$1" ] ;then
    echo "please input component name."
else
    IFS=
    NAME=`echo ${1:0:1} | tr [a-z] [A-Z]`"${1:1}"
    CONTENT=`cat "$_PATH"/index.js`
    CONTENT=${CONTENT//_Component_/"$NAME"}

    if [ ! -d "$NAME" ];then
        mkdir "$NAME"
    fi

    cd "$NAME"
    echo $CONTENT>index.js
    cp "$_PATH"/style.less style.less
    echo $CONTENT
fi
