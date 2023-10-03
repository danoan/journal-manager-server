#! /usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_PATH="${SCRIPT_PATH%/journals/*}/journals"

INPUT_FOLDER="${SCRIPT_PATH}/input"
OUTPUT_FOLDER="${SCRIPT_PATH}/output"

mkdir -p "${OUTPUT_FOLDER}"

BUILD_FOLDER="${OUTPUT_FOLDER}/build"
rm -rf "${BUILD_FOLDER}"
mkdir -p "${BUILD_FOLDER}"

jm b --ignore-safety-questions --build-location "${BUILD_FOLDER}" --build-instructions "${INPUT_FOLDER}/build-instructions.toml"  

rm -rf "${PROJECT_PATH}/site-old"
mkdir -p "${PROJECT_PATH}/site-old" 

if [ -d "${PROJECT_PATH}/site" ]
then
   mv ${PROJECT_PATH}/site/* "${PROJECT_PATH}/site-old"
else
   mkdir -p "${PROJECT_PATH}/site" 
fi

mv ${BUILD_FOLDER}/site/* "${PROJECT_PATH}/site"
