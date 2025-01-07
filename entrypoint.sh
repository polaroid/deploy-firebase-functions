#!/bin/bash

FUNCTIONS_DIR=${FUNCTIONS_DIR:-functions}

cd $FUNCTIONS_DIR; npm install

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FIREBASE_PROJECT}" ]; then
    echo "FIREBASE_PROJECT is missing"
    exit 1
fi

if [ -z "${DRY_RUN}" ]; then
    echo "DRY_RUN is missing. Will try to deploy the build results."
fi

# Initialize the command
CMD="firebase deploy"

# Add parameters
CMD="$CMD -m \"${GITHUB_REF} (${GITHUB_SHA})\""
CMD="$CMD --project ${FIREBASE_PROJECT}"
CMD="$CMD --only functions,hosting"

# Conditionally add --dry-run
if [ "$DRY_RUN" = "true" ]; then
    CMD="$CMD --dry-run"
fi

# Execute the command
eval $CMD
