#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%/journals/*}/journals"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"

mkdir -p "${OUTPUT_FOLDER}"

BUILD_FOLDER="${OUTPUT_FOLDER}/build"
rm -rf "${BUILD_FOLDER}"
mkdir -p "${BUILD_FOLDER}"

MODIFIED_FILE="$1"

MODIFIED_FILE_BASE_LOCATION="${MODIFIED_FILE%/journals-files/*}/journals-files"
MODIFIED_FILE_PREFIX_REMOVED="${MODIFIED_FILE#*/journals-files/}"
JOURNAL_FOLDER_NAME="${MODIFIED_FILE_PREFIX_REMOVED%%/*}"

JOURNAL_LOCATION_FOLDER="${MODIFIED_FILE_BASE_LOCATION}/${JOURNAL_FOLDER_NAME}"
echo "Rebuilding: ${JOURNAL_LOCATION_FOLDER}" 

jm b --do-not-build-index --ignore-safety-questions --build-location "${BUILD_FOLDER}" --jl "${JOURNAL_LOCATION_FOLDER}"

rm -rf "${PROJECT_PATH}/site/${JOURNAL_FOLDER_NAME}"
mv -f "${BUILD_FOLDER}/site/${JOURNAL_FOLDER_NAME}" "${PROJECT_PATH}/site"

