#!/bin/bash
#
# $NAME - $DESC
#

set -euo pipefail

VERSION="0.1.0"

usage() {
    cat <<EOF
$NAME v${VERSION} - $DESC

Usage: $NAME [options] [input]

Options:
  -h, --help     Show this help
  -v, --version  Show version
EOF
    exit 0
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help) usage ;;
        -v|--version) echo "$NAME v${VERSION}"; exit 0 ;;
        *) INPUT="$1" ;;
    esac
    shift
done

echo "$NAME v${VERSION} ready!"
echo "$DESC"
[[ -n "${INPUT:-}" ]] && echo "Processing: $INPUT"
