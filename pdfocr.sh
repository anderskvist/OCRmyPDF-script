#!/bin/bash

function die () {
    echo $1
    exit 1
}

test -f "${1}" || die "Could not read ${1}"
test ! -f "${2}" || die "File ${2} exists"

docker pull jbarlow83/ocrmypdf-tess4
docker tag jbarlow83/ocrmypdf-tess4 ocrmypdf
docker run --rm -v "$(pwd):/home/docker"   ocrmypdf -d -c -f "${1}" "${2}"
