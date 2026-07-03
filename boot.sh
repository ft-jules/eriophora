#!/usr/bin/env bash
# Bootstrap : curl -fsSL .../boot.sh | bash
set -euo pipefail
REPO="https://github.com/ft-jules/arch_setup.git"
DIR="$HOME/arch_setup"
command -v git >/dev/null || sudo pacman -S --noconfirm --needed git
[ -d "$DIR/.git" ] || git clone "$REPO" "$DIR"
cd "$DIR"
exec ./install.sh
