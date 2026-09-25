#!/usr/bin/env bash
LAYOUT="$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | head -n1)"
case "$LAYOUT" in
  *Russian*) printf '{"text":"RU","class":"russian","tooltip":"Russian"}' ;;
  *) printf '{"text":"EN","class":"english","tooltip":"English"}' ;;
esac
