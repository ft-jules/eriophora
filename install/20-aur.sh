#!/usr/bin/env bash
# yay + paquets AUR (source : packages/aur.txt)
set -euo pipefail
cd "$(dirname "$(realpath "$0")")/.."
if ! command -v yay >/dev/null; then
    echo "→ Installation de yay"
    tmp=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$tmp/yay-bin"
    (cd "$tmp/yay-bin" && makepkg -si --noconfirm)
    rm -rf "$tmp"
fi
grep -vE '^\s*(#|$)' packages/aur.txt | xargs yay -S --needed --noconfirm
echo "✓ Paquets AUR OK"
