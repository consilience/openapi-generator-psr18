#!/bin/bash

die() {
    echo "$*" 1>&2
    exit 1;
}

#
# Generate a PSR-18 client for an OpenAPI spec.
# Uses a few opinionated defaults, but we are just getting to know the tool.
#

for i in "$@"
do
    case $i in
        -g=*|--generated=*)
            GENERATED="${i#*=}"
            shift
            ;;
        -s=*|--spec=*|--specification=*)
            SPEC="${i#*=}"
            shift
            ;;
        -n=*|--namespace=*)
            NAMESPACE="${i#*=}"
            shift
            ;;
        -r=*|--resources=*)
            RESOURCES="${i#*=}"
            shift
            ;;
        -?|--help)
            echo Usage:
            echo "  " `basename $0`
            echo
            echo Options:
            echo "  -g, --generated=desination-directory"
            echo "  -s, --spec=source-openapi-spec"
            echo "  -n, --namespace=root-namespace"
            echo "  -r, --resources=resource-templates-directory"
            exit 0
            ;;
        *)
    esac
done

[ -f "${SPEC}" ] || die "OpenAPI specification file '${SPEC}' not found"

NAMESPACE=${NAMESPACE:-"OpenAPI\\Client"}

#EXECUTABLE="openapi-generator-cli-4.0.3.jar"
EXECUTABLE="openapi-generator-cli-4.1.0.jar"

# FIXME: cannot seem to find the parameters or variables for setting the
# composer package name of the generated code.
#PACKAGE=${3:-"vendor/package"}
#export GIT_USER_ID=vendor

# Directory for this script

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# FILEBASE is the basename of the spec.

BASENAME=`basename "${SPEC}"`
FILEEXT="${BASENAME##*.}"
FILEBASE="${BASENAME%.*}"

RESOURCES=${RESOURCES:-"${DIR}/../modules/openapi-generator/src/main/resources/php-psr18"}

# The generated code root directory.
# Use as supplied, or default.

DEFAULT_GENERATED="${DIR}/../generated/${FILEBASE}"
GENERATED=${GENERATED:-${DEFAULT_GENERATED}}

[ ! -d "${GENERATED}" ] && [ -d `dirname "${GENERATED}"` ] && mkdir "${GENERATED}"

[ -d "${GENERATED}" ] || die "Generation root directory '${GENERATED}' not found"

java -jar "${DIR}/${EXECUTABLE}" generate \
    -i "${SPEC}" \
    -t "${RESOURCES}" \
    -o "${GENERATED}" \
    -g php \
    --additional-properties=srcBasePath=src \
    --additional-properties=variableNamingConvention=camelCase \
    --additional-properties=invokerPackage="${NAMESPACE}"

