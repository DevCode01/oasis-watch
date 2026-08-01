#!/bin/bash
# Backup a directory to ~/backups with a timestamp.
set -euo pipefail

SRC="${1:-.}"
if [ ! -d "$SRC" ]; then
    echo "Error: directory not found: $SRC"
    exit 1
fi

BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

STAMP=$(date +%Y%m%d_%H%M%S)
ABS_SRC=$(cd "$SRC" && pwd)
NAME=$(basename "$ABS_SRC")
DEST="$BACKUP_DIR/${NAME}_${STAMP}.tar.gz"

tar -czf "$DEST" -C "$(dirname "$ABS_SRC")" "oasis-watch"
SIZE=$(du -h "$DEST" | awk '{print $1}')

echo "Backup created: $DEST"
echo "Size: $SIZE"
