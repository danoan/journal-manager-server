#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%install-journal-manager*}install-journal-manager"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

BUILD_MODE="${1}"

if [[ "${BUILD_MODE}" = "test" ]]
then
    pip install /journals/deploy-package/test/*.whl
elif [[ "${BUILD_MODE}" = "production" ]]
then
    pip install /journals/deploy-package/production/*.whl
elif [[ "${BUILD_MODE}" = "release" ]]
then
    pip install journal-manager
else
    echo "Build mode: ${BUILD_MODE} not recognized."
    exit 1
fi

# ls /root/journals does not work. ls /journals does work.
# during the building of the docker image, the paths are relative to workdir
# I am using /root in some of the paths below because those are stored and used later
# by the journal-manager app

echo "Initializing journal-manager*"
jm setup init --default-journal-folder "/journals/journals-files" --default-template-folder "/journals/templates" --default-text-editor "vim"
jm template register quick-notes "/journals/templates-temp/quick-notes"
rm -rf "/journals/templates-temp"

