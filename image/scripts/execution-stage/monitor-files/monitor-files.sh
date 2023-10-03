#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%/journals/*}/journals"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"


while true
do
    # For some reason, this is being executed only once. 
    # It was supposed that entr exits if a new folder was created.
    # This is not happening.
    # 
    # Therefore, the service needs to be restarted every time a new journal
    # is created.
    echo "Directory has changed. Building index page."
    "${PROJECT_PATH}/scripts/execution-stage/build-index-page/build-index-page.sh"
    find "${PROJECT_PATH}/journals-files" -type f | entr -n -d "${PROJECT_PATH}/scripts/execution-stage/rebuild-modified-journals/rebuild-modified-journals.sh" /_
done

