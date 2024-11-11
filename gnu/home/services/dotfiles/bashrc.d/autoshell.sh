#!/usr/bin/env bash
trap 'echo "Warning: A command has failed. Exiting the script. Line was ($0:$LINENO): $(sed -n "${LINENO}p" "$0")"; exit 3' ERR
set -Eeuo pipefail

#Run the given command via 'guix shell'
function ,
{
    pkg_ver="$(guix locate "$1"|grep /bin/|head -1|cut -f1)"
    pkg="$(echo $pkg_ver|cut -d@ -f1)"
    test -n "$pkg" && guix shell "$pkg"--"$@"
}