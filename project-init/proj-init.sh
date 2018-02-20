#/bin/sh
SELF_PATH="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"
SELF_PATH="$(readlink "$SELF_PATH" || echo $SELF_PATH)"
DIR_PATH="$(dirname "$SELF_PATH")"

dir="."
[ -n "$1" ] && dir="$1"
[ ! -d "$dir" ] && mkdir -p "$dir"
cd $dir

sh "$DIR_PATH/copy-files.sh"

BASE_NAME=$(basename $PWD)

if [ ! -f "package.json" ]; then
    npm init -y
    sed -i '' -e "s/ISC/MIT/" package.json
    sed -i '' -e "s/\"keywords\": \[\]/\"keywords\": [\"imcuttle\", \"$BASE_NAME\"]/" package.json
    sed -i '' -e "s/\"author\": \"\"/\"author\": \"imcuttle\"/" package.json
fi

[ ! -f "Readme.md" ] && {
    echo "# $BASE_NAME"
    echo "[![build status](https://img.shields.io/travis/imcuttle/$BASE_NAME/master.svg?style=flat-square)](https://travis-ci.org/imcuttle/$BASE_NAME)"
    echo "[![Test coverage](https://img.shields.io/codecov/c/github/imcuttle/$BASE_NAME.svg?style=flat-square)](https://codecov.io/github/imcuttle/$BASE_NAME?branch=master)"
    echo "[![NPM version](https://img.shields.io/npm/v/$BASE_NAME.svg?style=flat-square)](https://www.npmjs.com/package/$BASE_NAME)"
    echo "[![NPM Downloads](https://img.shields.io/npm/dm/$BASE_NAME.svg?style=flat-square&maxAge=43200)](https://www.npmjs.com/package/$BASE_NAME)"
} > Readme.md

mkdir test
git init
