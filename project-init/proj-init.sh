#/bin/sh
SELF_PATH="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"
SELF_PATH="$(readlink "$SELF_PATH" || echo $SELF_PATH)"
DIR_PATH="$(dirname "$SELF_PATH")"

dir="."
[ -n "$1" ] && dir="$1"
[ ! -d "$dir" ] && mkdir "$dir"
cd $dir
sh "$DIR_PATH/copy-license.sh"
cp -v "$DIR_PATH/.gitignore" .

BASE_NAME=$(basename $PWD)
[ ! -f "Readme.md" ] && echo "# $BASE_NAME" > Readme.md

if [ ! -f "package.json" ]; then
    npm init -y
    sed -i '' -e "s/ISC/MIT/" package.json
fi

