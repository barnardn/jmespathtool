#!/bin/bash

set -e

if [[ -z ${PROJECT_DIR} ]]; then
    echo "Assuming path to project is $(pwd). If this is wrong try again from the project's root directory."

    ./Scripts/formatting-pre-build-actions.sh "$(pwd)"
    ./Scripts/formatting-post-build-actions.sh "$(pwd)" "$(pwd)/Amion.xcodeproj"
else
    echo "This script is meant to be ran manually and not from Xcode."
    exit 1
fi
