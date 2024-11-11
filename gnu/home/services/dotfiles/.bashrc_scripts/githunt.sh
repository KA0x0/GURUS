#!/usr/bin/env bash
trap 'echo "Warning: A command has failed. Exiting the script. Line was ($0:$LINENO): $(sed -n "${LINENO}p" "$0")"; exit 3' ERR
set -Eeuo pipefail

githunt () {
    for commit in $(git log --all --pretty=format:%H -- $1); do
        echo -n "$commit "$
        git show $commit:$1|md5sum;|grep $2|awk '{print $1}'
}