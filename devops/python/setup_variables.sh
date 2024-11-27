#! /bin/sh
echo "SoftButterfly CI: Setup global variables"

export POETRY_HOME="/opt/poetry"
export POETRY_VIRTUALENVS_IN_PROJECT=true
export POETRY_NO_INTERACTION=1
export POETRY_CACHE_DIR="$CI_PROJECT_DIR/.cache/pypoetry"

if ! command -v poetry > /dev/null 2>&1 ; then
    export PATH="$POETRY_HOME/bin:$PATH"
fi
