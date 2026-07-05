set shell := ["bash", "-c"]

default:
    @just --list

# Tout : système + outils dev
update-all: update-sys update-dev

# Système seul
update-sys: pacman aur firmware clean reboot-check

pacman:
    sudo pacman -Syu --noconfirm

aur:
    -yay -Syu --noconfirm

firmware:                      # fwupd (marche sur Arch)
    -sudo fwupdmgr refresh --force
    -sudo fwupdmgr update -y

clean:                         # cache pacman (paccache) + orphelins
    -sudo paccache -r
    -pacman -Qtdq | sudo pacman -Rns --noconfirm -

reboot-check:                  # prévient si le kernel a été mis à jour
    @[ -n "$(pacman -Q linux)" ] && echo "→ si le kernel a bougé, reboot conseillé"

# Outils dev (skip silencieux si l'outil n'est pas là)
update-dev:
    @-command -v npm    >/dev/null && npm install -g npm  || true
    @-command -v pipx   >/dev/null && pipx upgrade-all    || true
    @-command -v rustup >/dev/null && rustup update       || true
