#!/bin/bash

# Generate a PSR-18 client for an OpenAPI spec.

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -ge 1 ] || die "$0 openapi-spec [namespace] [package-name]"

[ -f "$1" ] || die "OpenAPI specification file '$1' not found"

SPEC="$1"

NAMESPACE=${2:-"OpenAPI\\Client"}

#PACKAGE=${3:-"vendor/package"}
#export GIT_USER_ID=vendor

# Directory for this script

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export BASENAME=`basename ${SPEC}`
export FILEEXT=${BASENAME##*.}
export FILEBASE=${BASENAME%.*}

java -jar openapi-generator-cli-4.0.0.jar generate \
	-i "${SPEC}" \
	-t ${DIR}/resources/php-psr18 \
	-o "${DIR}/generated/${FILEBASE}" \
	-g php \
	--additional-properties=srcBasePath=src \
	--additional-properties=variableNamingConvention=camelCase \
	--additional-properties=invokerPackage="$NAMESPACE"

