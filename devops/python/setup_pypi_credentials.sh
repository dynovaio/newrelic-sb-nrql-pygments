#! /bin/sh
BASE_DIR="$( cd "$( dirname "$0" )" > /dev/null 2>&1 && pwd )"

. "$BASE_DIR/setup_variables.sh"

echo "SoftButterfly CI: Setting up Pypi credentials"

echo "* Setting up credentials"
poetry config pypi-token.pypi "$PYPI_TOKEN"
