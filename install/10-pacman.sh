#!/usr/bin/env bash
# Paquets des dépôts officiels (source : packages/pacman.txt)
set -euo pipefail
cd "$(dirname "$(realpath "$0")")/.."
grep -vE '^\s*(#|$)' packages/pacman.txt | sudo pacman -S --needed --noconfirm -
echo "✓ Paquets pacman OK"
