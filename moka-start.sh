#!/bin/bash  

# curl -s https://raw.githubusercontent.com/imcuttle/my-shell-code/master/moka-start.sh | bash 
# /dev/stdin

# some functions begin
echoerr() { echo "$@" 1>&2; }

command_exists () {
    type "$1" &> /dev/null ;
}
command_exists_exit() {
    if ! command_exists "$1" ; then
        echoerr "${1} command not exists"
        exit
    fi
}
# some functions end

# command check
command_exists_exit npm
command_exists_exit git


# npm uninstall -g moka-cli
npm --registry=https://registry.npm.taobao.org install moka-cli -g

mkdir moka-blog
cd moka-blog

moka init

git clone https://github.com/imcuttle/moka-theme-toy.git themes/toy
echo `curl -s https://imcuttle.github.io/moka_api/moka.config.json` > moka.config.json

moka generate
URL=http://localhost:9876
if ! command_exists open; then
    start $URL
else
    open $URL    
fi

moka staticServer -p 9876 #backgroud job
