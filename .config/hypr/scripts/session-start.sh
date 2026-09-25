#!/usr/bin/env bash
set -u
mkdir -p "$HOME/Pictures/Screenshots" "$HOME/Videos/Recordings"
"$HOME/.config/hypr/scripts/wallpaper.sh" --default >/dev/null 2>&1 &
