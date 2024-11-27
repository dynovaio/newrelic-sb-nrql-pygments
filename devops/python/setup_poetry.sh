#! /bin/sh
BASE_DIR="$( cd "$( dirname "$0" )" > /dev/null 2>&1 && pwd )"

. "$BASE_DIR/setup_variables.sh"

echo "SoftButterfly CI: Install Poetry"

echo "* Install Poetry"
curl -sSL https://install.python-poetry.org | python3 -

echo "* Basic Poetry Setings"
/opt/poetry/bin/poetry config virtualenvs.in-project true
/opt/poetry/bin/poetry config cache-dir "$CI_PROJECT_DIR/.cache/pypoetry"
