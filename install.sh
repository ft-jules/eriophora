#!/usr/bin/env bash
# Orchestrateur : déroule install/*.sh dans l'ordre numérique.
set -euo pipefail
cd "$(dirname "$(realpath "$0")")"
for step in install/[0-9]*.sh; do
    echo -e "\n\033[1;34m==> ${step}\033[0m"
    bash "$step"
done
echo -e "\n\033[1;32m✅ eriophora installé. Redémarre la session pour tout charger.\033[0m"
