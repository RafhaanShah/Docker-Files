#!/bin/bash

# Find all top level directories over a week old, move them, make a symlink in the original directory linking to the new location
# /usr/bin/find /home/raf/docker/elk/elasticsearch/nodes/0/indices/* -maxdepth 0 -type d -mtime +7 -exec /home/raf/docker/elk/archive.sh {} \;

set -e

TARGET="/mnt/hdd/AppData/Elasticsearch/"
BASENAME="$(basename "$1")"

mkdir -p "${TARGET}"
mv "$1" "${TARGET}"
ln -s "${TARGET}${BASENAME}" "$1"
