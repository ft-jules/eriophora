#!/usr/bin/env bash
# Vérifications avant install.
set -euo pipefail
[ -f /etc/arch-release ] || { echo "❌ Pas une Arch."; exit 1; }
[ "$EUID" -ne 0 ] || { echo "❌ Lancer en utilisateur normal (sudo sera demandé)."; exit 1; }
ping -c1 -W3 archlinux.org >/dev/null || { echo "❌ Pas de réseau."; exit 1; }
# multilib (requis pour steam)
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo "→ Activation du dépôt multilib"
    sudo sed -i '/^#\[multilib\]/,/^#Include/ s/^#//' /etc/pacman.conf
fi
sudo pacman -Syu --noconfirm
echo "✓ Preflight OK"
