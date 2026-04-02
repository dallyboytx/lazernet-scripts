#!/usr/bin/env bash
# install.sh — symlink dotfiles and copy scripts for lazernet-scripts
# Run from the repo root: bash install.sh

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="/home/scripts"
HOME_DIR="${HOME}"

echo "==> Installing lazernet-scripts from $REPO_DIR"

# --- Dotfiles ---
echo ""
echo "==> Symlinking dotfiles..."
for dotfile in "$REPO_DIR/dotfiles"/.*; do
    name="$(basename "$dotfile")"
    [ "$name" = "." ] || [ "$name" = ".." ] && continue
    target="${HOME_DIR}/${name}"
    if [ -L "$target" ]; then
        echo "  [skip]  $target (already a symlink)"
    elif [ -f "$target" ]; then
        echo "  [backup] $target → ${target}.bak"
        mv "$target" "${target}.bak"
        ln -s "$dotfile" "$target"
        echo "  [link]  $target"
    else
        ln -s "$dotfile" "$target"
        echo "  [link]  $target"
    fi
done

# --- Scripts ---
echo ""
echo "==> Installing scripts to $SCRIPTS_DIR..."
if [ ! -d "$SCRIPTS_DIR" ]; then
    echo "  Creating $SCRIPTS_DIR..."
    sudo mkdir -p "$SCRIPTS_DIR"
fi

for script in "$REPO_DIR/scripts"/*; do
    name="$(basename "$script")"
    dest="${SCRIPTS_DIR}/${name}"
    sudo cp "$script" "$dest"
    sudo chmod +x "$dest"
    echo "  [copy]  $dest"
done

echo ""
echo "==> Done. Scripts installed to $SCRIPTS_DIR"
echo "    Reload shell: source ~/.bashrc"
