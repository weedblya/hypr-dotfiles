# Hyprland dotfiles

Hyprland 0.56.x dotfiles for Arch Linux and Gentoo.

## Features

- Hyprland configuration with Lua modules
- Waybar
- Fuzzel
- Kitty
- SwayNC
- Fastfetch
- Grim + Slurp screenshots
- Wallpaper switching with `awww`
- Matugen wallpaper-based theming
- Hyprlock + Hypridle
- Arch installer script
- Manual Gentoo installation

## Requirements

The configuration expects a Wayland session with Hyprland.

Wallpapers are loaded from:

```text
~/.config/wallpapers/
```

Default wallpaper slots:

- `mountain-pixel.jpg`
- `cogech.jpg`
- `miku.jpg`
- `tomokokuroki.jpg`

The default wallpaper is `mountain-pixel.jpg`.

---

## Arch Linux — automatic installation

Clone the repository and run the installer:

```bash
git clone https://github.com/weedblya/hypr-dotfiles.git
cd hypr-dotfiles

chmod +x install-arch.sh
./install-arch.sh
```

The installer:

1. Installs the main packages with `pacman`.
2. Installs `awww` and `matugen` from the AUR using `yay` or `paru`.
3. Backs up an existing `~/.config/hypr`.
4. Copies the repository configuration into `~/.config`.
5. Makes the included shell scripts executable.
6. Creates directories for screenshots, recordings and wallpapers.

If you do not have an AUR helper installed, install either `yay` or `paru` first, then run the installer again.

After installation, put the wallpapers into:

```text
~/.config/wallpapers/
```

Then start Hyprland.

---

## Gentoo — manual installation

There is no Gentoo installer script in this repository. Install the required software manually with Portage.

First update the repository and world set:

```bash
sudo emerge --sync
sudo emerge -avuDN @world
```

### 1. Install the main packages

A starting point is:

```bash
sudo emerge \
  gui-wm/hyprland \
  gui-apps/waybar \
  gui-apps/fuzzel \
  gui-apps/grim \
  gui-apps/slurp \
  gui-apps/wl-clipboard \
  gui-apps/wf-recorder \
  gui-apps/kitty \
  gui-apps/fastfetch \
  gui-apps/brightnessctl \
  gui-apps/playerctl \
  app-misc/jq \
  net-misc/networkmanager \
  net-wireless/bluez \
  media-video/pipewire \
  media-video/wireplumber
```

SwayNC, Hypridle and Hyprlock may need to be installed separately depending on the state of your Gentoo repository/overlay.

Check package availability with:

```bash
emerge --search swaync
emerge --search hypridle
emerge --search hyprlock
```

If a package is not available in your configured repositories, use the corresponding upstream project or an appropriate Gentoo overlay.

### 2. Install Matugen and awww

These are not assumed to be available from the main Gentoo package set used by this dotfiles repository.

If you use Rust/Cargo, you can install them from their upstream sources:

```bash
cargo install matugen
cargo install --git https://codeberg.org/LGFae/awww
```

Make sure Cargo's binary directory is in your `PATH`:

```bash
export PATH="$HOME/.cargo/bin:$PATH"
```

### 3. Copy the configuration

From the cloned repository:

```bash
cd hypr-dotfiles

mkdir -p ~/.config
cp -a .config/. ~/.config/

chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/waybar/scripts/*.sh

mkdir -p ~/.config/wallpapers
```

Put the wallpapers into:

```text
~/.config/wallpapers/
```

### 4. Start Hyprland

Log into your Hyprland session normally.

The configuration starts the Wayland services used by the dotfiles and applies the default wallpaper.

You do **not** need to install systemd specifically for these dotfiles. Gentoo with OpenRC is fine.

---

## Keybinds

| Key | Action |
|---|---|
| `Super + Enter` | Terminal |
| `Super + Q` | Close window |
| `Super + L` | Lock screen |
| `Super + Space` | App launcher |
| `Super + W` | Browser |
| `Super + E` | File manager |
| `Super + Shift + E` | Yazi |
| `Super + Z` | Toggle floating |
| `Super + X` | Wallpaper selector |
| `Super + F` | Fullscreen |
| `Super + P` | Pseudo-tile |
| `Super + J` | Toggle split |
| `Super + Arrow keys` | Focus window |
| `Super + 1..0` | Switch workspace |
| `Super + Shift + 1..0` | Move window to workspace |
| `Print` | Full screenshot |
| `Shift + Print` | Area screenshot |

## Wallpaper theming

When Matugen is installed, selecting a wallpaper regenerates the theme for:

- Waybar
- Fuzzel
- Kitty
- GTK/CSS theme variables

The wallpaper selector is bound to:

```text
Super + X
```

## Repository layout

```text
.config/
├── fastfetch/
├── fuzzel/
├── hypr/
├── kitty/
├── matugen/
├── swaync/
├── theme/
├── wallpapers/
└── waybar/

packages/
├── arch.txt
└── gentoo.txt

install-arch.sh
README.md
```
