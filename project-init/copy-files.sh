#/usr/bin/env sh
## best way to get PATHS
SELF_PATH="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"
SELF_PATH="$(readlink "$SELF_PATH" || echo $SELF_PATH)"
DIR_PATH="$(dirname "$SELF_PATH")"

run () {
    echo "$@"
    eval "$@"
}

run cp "$DIR_PATH/License" .
run cp "$DIR_PATH/.gitignore" .
run cp "$DIR_PATH/.travis.yml" .
run cp "$DIR_PATH/.editorconfig" .
run cp "$DIR_PATH/.eslintignore" .
run cp "$DIR_PATH/.eslintrc" .
run cp "$DIR_PATH/.babelrc" .
