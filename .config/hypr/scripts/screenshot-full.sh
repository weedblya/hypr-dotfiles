#!/usr/bin/env bash
set -euo pipefail
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
grim "$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
