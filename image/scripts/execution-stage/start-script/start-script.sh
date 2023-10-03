#! /usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="${SCRIPT_DIR%journals/*}journals"

pushd "${PROJECT_DIR}" > /dev/null
node "http-server/init.js"
popd > /dev/null

