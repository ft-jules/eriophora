# eriophora

Install Arch + Hyprland reproductible, façon Omarchy. Un PC neuf → mon environnement complet.

## Usage
Sur une Arch de base fraîchement installée (voir vault : `Arch Linux - Install`) :
```bash
curl -fsSL https://raw.githubusercontent.com/ft-jules/eriophora/main/boot.sh | bash
```
Ou manuellement : `git clone https://github.com/ft-jules/eriophora ~/eriophora && ~/eriophora/install.sh`

Rejouable : chaque étape est idempotente (`--needed`, checks avant action).

## Principes
Open source d'abord · clavier roi (UI cachée accessible souris) · apparence 100% custom · épuré · OLED-friendly · reproductible.

## Structure
- `install/` — étapes numérotées, exécutées dans l'ordre par `install.sh`
- `packages/` — listes pacman / AUR (source de vérité)
- `config/` — dotfiles, layout stow (`stow -d config -t ~ <pkg>`)
- `themes/` — un dossier par thème ; `~/.config/themes/current` = symlink
- `bin/` — scripts maison (`theme-set`, ...)

## Règle d'or
Aucune couleur en dur dans `config/` : tout est inclus depuis `~/.config/themes/current/`.
Chaque modif de config passe par ce repo (commit), jamais de modif locale non versionnée.
