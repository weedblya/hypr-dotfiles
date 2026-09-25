#!/usr/bin/env bash
set -euo pipefail
DIR="$HOME/.config/wallpapers"
DEFAULT="$DIR/mountain-pixel.jpg"
WALLPAPER="$DEFAULT"
if [[ $# -gt 0 ]]; then WALLPAPER="$1"; fi

if [[ "$WALLPAPER" == "--menu" ]]; then
    command -v fuzzel >/dev/null 2>&1 || exit 1
    choice="$(find "$DIR" -maxdepth 1 -type f -printf '%f\n' | sort | fuzzel -d --prompt='Wallpaper: ')"
    [[ -n "$choice" ]] || exit 0
    WALLPAPER="$DIR/$choice"
elif [[ "$WALLPAPER" == "--default" ]]; then
    WALLPAPER="$DEFAULT"
fi

[[ -f "$WALLPAPER" ]] || exit 1
if command -v matugen >/dev/null 2>&1; then
    matugen image "$WALLPAPER" -m dark
elif command -v awww >/dev/null 2>&1; then
    awww img "$WALLPAPER" --resize fit
fi
