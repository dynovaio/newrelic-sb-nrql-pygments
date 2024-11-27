#! /bin/sh
BASE_DIR="$( cd "$( dirname "$0" )" > /dev/null 2>&1 && pwd )"

. "$BASE_DIR/setup_variables.sh"

echo "SoftButterfly CI: Publishing docs for version ${CI_COMMIT_TAG}"

echo "* Publishing docs"
mv _build/html public
