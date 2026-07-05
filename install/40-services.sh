#!/usr/bin/env bash
# Services & shell
set -euo pipefail
cd "$(dirname "$(realpath "$0")")/.."
sudo systemctl enable greetd.service
sudo systemctl enable bluetooth.service
systemctl --user enable pipewire pipewire-pulse wireplumber 2>/dev/null || true
# zsh par défaut
[ "$(basename "$SHELL")" = "zsh" ] || chsh -s /usr/bin/zsh
# keyd : remap clavier (Alt droite -> flèche droite), config système hors stow
if command -v keyd >/dev/null; then
    sudo install -Dm644 system/keyd/default.conf /etc/keyd/default.conf
    sudo systemctl enable --now keyd.service
fi
# TODO : config greetd (tuigreet) → /etc/greetd/config.toml (template à ajouter)
echo "✓ Services OK"
