#!/usr/bin/env bash
set -euo pipefail

# Run the given command via 'guix shell'
function ,
{
    pkg_ver="$(guix locate "$1"|grep /bin/|head -1|cut -f 1)"
    pkg="$(echo $pkg_ver|cut -d @ -f 1)"
    test -n "$pkg" && guix shell "$pkg"--"$@"
}
