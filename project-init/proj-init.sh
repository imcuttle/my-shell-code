#/bin/sh
SELF_PATH="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"
SELF_PATH="$(readlink "$SELF_PATH" || echo $SELF_PATH)"
DIR_PATH="$(dirname "$SELF_PATH")"

sh "$DIR_PATH/copy-license.sh"
cp -v "$DIR_PATH/.gitignore" .
