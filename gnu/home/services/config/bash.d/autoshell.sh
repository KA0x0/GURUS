#!/usr/bin/env bash
set -euo pipefail

#Run the given command via 'guix shell'
function ,
{
    pkg_ver="$(guix locate "$1"|grep /bin/|head -1|cut -f1)"
    pkg="$(echo $pkg_ver|cut -d@ -f1)"
    test -n "$pkg" && guix shell "$pkg"--"$@"
}