#! /usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="${SCRIPT_DIR%journals/*}journals"

pushd "${PROJECT_DIR}" > /dev/null
# Setup cron job to build the journals every day in the morning

# echo "00 6 * * 7 ${SCRIPT_DIR}/init-week-puzzles.sh" | crontab -
# crond

node "http-server/init.js"
popd > /dev/null

