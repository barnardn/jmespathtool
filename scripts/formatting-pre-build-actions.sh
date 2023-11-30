#!/bin/bash

set -e

PATH_TO_PROJECT_DIRECTORY=$1

cd ${PATH_TO_PROJECT_DIRECTORY}

echo "Starting - Swift Format"
${PATH_TO_PROJECT_DIRECTORY}/buildtools/swiftformat ${PATH_TO_PROJECT_DIRECTORY}
echo "Finished - Swift Format"
