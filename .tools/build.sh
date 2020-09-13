#!/usr/bin/env bash

set -e

function set_basic_env {
    export GIT_BRANCH_BASENAME=`git rev-parse --abbrev-ref HEAD`
    export GIT_COMMIT="`git log | head -n 1 | awk '{print $2}'`"
    export PROJECT_NAME=`basename $(git rev-parse --show-toplevel)`
    export SCRIPT_DIR=$(dirname $0)
    export PROJECT_ROOT="${SCRIPT_DIR}/../"
    export BUILD_DIR="${PROJECT_ROOT}/.build"
    mkdir -p ${BUILD_DIR}

    echo "GIT_BRANCH_BASENAME=${GIT_BRANCH_BASENAME}"
    echo "GIT_COMMIT=${GIT_COMMIT}"
    echo "PROJECT_NAME=${PROJECT_NAME}"
    echo "SCRIPT_DIR=${SCRIPT_DIR}"
    echo "PROJECT_ROOT=${PROJECT_ROOT}"
    echo "BUILD_DIR=${BUILD_DIR}"
}
set_basic_env

echo "$PROJECT_ROOT"
EXEC="$BUILD_DIR/$PROJECT_NAME"
go build -v -o "$EXEC" $PROJECT_ROOT

VERSION=$($EXEC -v|awk '{print $3}')
export TARNAME="$PROJECT_NAME-mac64-$VERSION.tar.xz"
export TARABS="$BUILD_DIR/$TARNAME"

echo "TARNAME=$TARNAME"
echo "TARABS=$TARABS"
cd "$BUILD_DIR" && tar caf "$TARNAME" "$PROJECT_NAME"