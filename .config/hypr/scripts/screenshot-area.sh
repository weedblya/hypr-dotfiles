#!/usr/bin/env bash
set -euo pipefail
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
GEOM="$(slurp)" || exit 0
grim -g "$GEOM" "$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
