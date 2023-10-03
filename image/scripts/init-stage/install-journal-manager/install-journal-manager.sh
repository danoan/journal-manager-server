#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%install-journal-manager*}install-journal-manager"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"
mkdir -p "${OUTPUT_FOLDER}"

BUILD_MODE="${1}"

pushd "${OUTPUT_FOLDER}" >/dev/null

    git clone https://github.com/danoan/journal-manager
    cd journal-manager
    pip install .

    echo "Initializing journal-manager"
    jm setup init --default-journal-folder "/journals/journals-files" --default-template-folder "/journals/templates" --default-text-editor "vim"

    echo "Registering quick-notes template**"
    jm template register quick-notes "templates/quick-notes"

popd > /dev/null

