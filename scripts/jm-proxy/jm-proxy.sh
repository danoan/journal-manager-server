#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

CONTAINER_NAME="journals-file-monitor"

docker exec "${CONTAINER_NAME}" jm ${@} || { echo "$?"; exit 1; }
# docker exec "${CONTAINER_NAME}" scripts/execution-stage/build-index-page/build-index-page.sh 


