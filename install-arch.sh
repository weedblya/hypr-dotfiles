#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "$0")" && pwd)"

if [[ "$(uname -s)" != "Linux" ]] || ! command -v pacman >/dev/null 2>&1; then
    echo "This installer is for Arch Linux / Arch-based systems."
    exit 1
fi

PACKAGES=(
  hyprland hypridle hyprlock waybar swaync fuzzel kitty yazi fastfetch
  grim slurp wl-clipboard cliphist wf-recorder brightnessctl playerctl
  jq libnotify networkmanager bluez bluez-utils pipewire wireplumber
)

sudo pacman -Syu --needed "${PACKAGES[@]}"

if command -v yay >/dev/null 2>&1; then
    yay -S --needed awww matugen
elif command -v paru >/dev/null 2>&1; then
    paru -S --needed awww matugen
else
    echo "Install yay or paru, then run: yay -S --needed awww matugen"
    exit 1
fi

mkdir -p "$HOME/.config" "$HOME/Pictures/Screenshots" "$HOME/Videos/Recordings" "$HOME/.config/wallpapers"

if [[ -d "$HOME/.config/hypr" ]]; then
    BACKUP="$HOME/.config/hypr.backup.$(date +%Y%m%d-%H%M%S)"
    cp -a "$HOME/.config/hypr" "$BACKUP"
    echo "Backup: $BACKUP"
fi

cp -a "$ROOT/.config/." "$HOME/.config/"
find "$HOME/.config/hypr/scripts" -type f -name '*.sh' -exec chmod +x {} +
find "$HOME/.config/waybar/scripts" -type f -name '*.sh' -exec chmod +x {} + 2>/dev/null || true

echo "Done. Put wallpapers into $HOME/.config/wallpapers/"
