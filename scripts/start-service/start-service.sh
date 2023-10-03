#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICES_PATH="${SCRIPT_PATH%Services*}Services"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

pushd "${SERVICES_PATH}" > /dev/null
    docker-compose up --build --force-recreate -d journals journals-file-monitor
popd > /dev/null

