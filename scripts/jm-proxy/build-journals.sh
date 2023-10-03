#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONTAINER_NAME="journals-file-monitor"

docker exec "${CONTAINER_NAME}" jm b --ignore-safety-questions --build-location "/journals" ${@}

