#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%journal-manager*}journal-manager"
SERVICES_PATH="${SCRIPT_PATH%Services*}Services"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

BUILD_MODE="${1}" # test or production
DEPLOY_ACTION="${2:-start}" # start or stop

echo "Project Path: ${PROJECT_PATH}"
echo "Services Path: ${SERVICES_PATH}"
echo "Build Mode: ${BUILD_MODE}"
echo "Deploy Action: ${DEPLOY_ACTION}"
echo "Address: 192.168.1.14:3961"

if [[ "${BUILD_MODE}" = "test" ]]
then
    "${PROJECT_PATH}/test-deploy/scripts/stop-service/stop-service.sh"
    if [[ "${DEPLOY_ACTION}" = "start" ]]
    then
        "${PROJECT_PATH}/test-deploy/scripts/start-service/start-service.sh"
    fi
elif [[ "${BUILD_MODE}" = "production" ]]
then
    "${PROJECT_PATH}/scripts/stop-service/stop-service.sh"
    if [[ "${DEPLOY_ACTION}" = "start" ]]
    then
        "${PROJECT_PATH}/scripts/start-service/start-service.sh"
    fi
else
    echo "The mode: ${BUILD_MODE} is not recognized."
    exit 1
fi

# pip download --no-deps --index-url http://pypi-server.barriguinhas.fr journal_manager --trusted-host pypi-server.barriguinhas.fr 

