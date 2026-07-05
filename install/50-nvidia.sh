#!/usr/bin/env bash
# Conditionnel : GPU NVIDIA (Legion : RTX 4060 Mobile + iGPU AMD, PRIME offload)
set -euo pipefail
if ! lspci | grep -qi nvidia; then
    echo "↷ Pas de GPU NVIDIA, étape sautée."
    exit 0
fi
sudo pacman -S --needed --noconfirm nvidia-open nvidia-utils lib32-nvidia-utils
# modeset requis pour Wayland
if ! grep -q "nvidia-drm.modeset=1" /etc/default/grub; then
    sudo sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="/&nvidia-drm.modeset=1 /' /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
fi
# TODO : variables d'env PRIME offload (prime-run) + test `nvidia-smi`
echo "✓ NVIDIA OK"
