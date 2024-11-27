#! /bin/sh
BASE_DIR="$( cd "$( dirname "$0" )" > /dev/null 2>&1 && pwd )"

. "$BASE_DIR/setup_variables.sh"

echo "SoftButterfly CI: Build docs for version ${CI_COMMIT_TAG}"

echo "* Building docs"
poetry run jupyter-book clean .
poetry run jupyter-book build .
