#! /bin/sh
BASE_DIR="$( cd "$( dirname "$0" )" > /dev/null 2>&1 && pwd )"

. "${BASE_DIR}/setup_variables.sh"

BASEPYTHON="${CI_JOB_NAME##*:}"

echo "SoftButterfly CI: Publish coverage report to Codacy for environment ${BASEPYTHON}"

# Send coverage report only on master branch and job is run for python 3.11
if [ "$CI_COMMIT_BRANCH" = "master" ] && [ "$BASEPYTHON" = "py311" ]; then
    echo "* Publish coverage report to Codacy is enabled"

    echo "* Downloading codacy report uploader."
    curl -Ls --output codacy_report_uploader.sh https://coverage.codacy.com/get.sh
    chmod +x codacy_report_uploader.sh

    echo "* Uploading reports"
    ./codacy_report_uploader.sh
else
    echo "* Publish coverage report to Codacy is disabled."
fi
