#!/usr/bin/env bash
# Thème par défaut
set -euo pipefail
cd "$(dirname "$(realpath "$0")")/.."
./bin/theme-set default || true
echo "✓ Thème par défaut appliqué"
