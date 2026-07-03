#!/usr/bin/env bash
# Services & shell
set -euo pipefail
sudo systemctl enable greetd.service
sudo systemctl enable bluetooth.service
systemctl --user enable pipewire pipewire-pulse wireplumber 2>/dev/null || true
# zsh par défaut
[ "$(basename "$SHELL")" = "zsh" ] || chsh -s /usr/bin/zsh
# TODO : config greetd (tuigreet) → /etc/greetd/config.toml (template à ajouter)
echo "✓ Services OK"
