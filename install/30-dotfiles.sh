#!/usr/bin/env bash
# Dotfiles via stow : config/<pkg>/... → ~/
set -euo pipefail
cd "$(dirname "$(realpath "$0")")/.."
sudo pacman -S --needed --noconfirm stow
for pkg in config/*/; do
    pkg=$(basename "$pkg")
    [ "$pkg" = mako ] && continue   # mako : généré par theme-set (pas d'include), non symlinké
    echo "→ stow $pkg"
    stow --restow -d config -t "$HOME" "$pkg"
done
echo "✓ Dotfiles OK"
