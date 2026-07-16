# Arch — Brief install (handoff Claude Code)

> Fichier auto-suffisant à déposer dans le repo **eriophora** (ex. `docs/handoff.md`). Le coller / le faire lire à Claude Code sur Arch pour reprendre l'install avec tout le contexte. *(Version condensée des notes Obsidian ; pas de wikilinks nécessaires.)*

## 🎯 Rôle attendu de l'agent
Accompagner l'install **Arch + Hyprland reproductible** (façon Omarchy), phase par phase. Règles :
- **Chaque install/config passe par le repo `eriophora`** → proposer le commit correspondant. Jamais de modif non versionnée.
- **Approbation avant toute écriture** (montrer la commande/le diff, attendre le OK).
- La preuve que rien ne manque = **test VM QEMU**, pas la réinstall.

## 🖥️ Machine & partitions (Lenovo Legion, triple boot)
- `nvme0n1p1` (ext4) → `/boot` Arch · `nvme0n1p2` (ESP partagée Ubuntu, **NE JAMAIS FORMATER**) · `nvme0n1p4` (LUKS2 `cryptroot` → ext4 → `/`).
- Ubuntu = `nvme0n1p3` · Windows = `nvme1n1` — **intacts, ne pas toucher**.
- **UUID LUKS p4** : `fe089cfb-a230-45d5-aba7-f8c521a2646c` (cmdline `rd.luks.name=…=cryptroot`).
- Initramfs : **systemd + hook `sd-encrypt`** (pas `encrypt`/`crypttab`). Bootloader : GRUB (`EFI/Arch`).

## ✅ État — Phase 1 (Base) TERMINÉE
pacstrap + genfstab, config système (timezone Paris, locales fr/en, hostname `jules-arch`, user `jules` wheel+sudo), NetworkManager activé, GRUB installé, mots de passe root+jules, entrées UEFI **Arch / ubuntu / Windows** bootables. **Arch boote** (GRUB Arch → passphrase LUKS → login).

## ⏭️ Reste au 1er boot Arch (finir Phase 1)
```bash
nmcli device wifi connect "Romanelli" --ask          # wifi
sudo grub-mkconfig -o /boot/grub/grub.cfg            # doit afficher "Found Ubuntu" + "Found Windows"
claude                                                # déjà pré-installé + connecté (sinon: curl -fsSL https://claude.ai/install.sh | bash)
```

## 🗺️ Roadmap
1. **Phase 1** — finir le 1er boot (ci-dessus).
2. **Phase 2 — Hyprland + apps** : installer la Cible (ci-dessous) par blocs, tester Hyprland, **NVIDIA** (nvidia-open + `nvidia-drm.modeset=1` + PRIME offload AMD/NVIDIA). Chaque paquet validé → `packages/pacman.txt` / `aur.txt` ; chaque config → `config/`.
3. **Phase 3 — Repo reproductible** : `install.sh` + étapes `install/10-pacman, 20-aur, 30-dotfiles (stow), 40-services, 50-nvidia`. Extraire `pacman -Qqe`.
4. **Phase 4 — Finitions** : thème GRUB Matrix · secrets (token Claude hors repo) · commit + push.
5. **Test VM QEMU vierge** = validation reproductibilité.

## 🧱 Repo eriophora (déjà créé, public, cloné dans `~/Documents/eriophora`)
```
eriophora/  boot.sh · install.sh · install/ (étapes numérotées) · packages/ (pacman.txt, aur.txt)
            config/ (hypr, waybar, kitty, rofi, mako… via stow ; couleurs importées depuis themes/current)
            themes/ (1 dossier/thème + wallpaper ; current = symlink) · bin/ (theme-set…)
```
Défaut thème : **punpun** (noir pur, OLED).

## 🎛️ Cible actée (à installer en Phase 2)
Compositeur **Hyprland** · barre **waybar** · lanceur **rofi-wayland** · notifs **mako** · lock/idle **hyprlock+hypridle** · fond **hyprpaper** · screenshots **hyprshot** · presse-papiers **cliphist (via rofi)** · login **greetd+tuigreet** · mdp **rbw+rofi-rbw** · terminal **kitty** · shell **zsh** · éditeur **neovim** (VSCodium en transition) · navigateur **zen-browser** (seul) · conteneurs **podman+distrobox** (`alias docker=podman`) · fichiers **yazi + thunar** · PDF/img/vidéo **zathura + imv + mpv** · mixeur **pavucontrol** · BT **blueman** · monitoring **btop** · police **JetBrainsMono Nerd Font** · mode nuit **hyprsunset** · audio **pipewire + wireplumber** · VPN **NordVPN** (Mullvad candidat).

```bash
# Dépôts officiels (multilib requis pour steam)
pacman -S hyprland waybar kitty rofi-wayland mako hyprlock hypridle hyprpaper \
  grim slurp wl-clipboard cliphist brightnessctl greetd greetd-tuigreet \
  pipewire pipewire-pulse wireplumber rbw zsh neovim clang gdb valgrind nasm \
  python podman distrobox obsidian steam \
  yazi thunar gvfs zathura zathura-pdf-mupdf imv mpv \
  pavucontrol blueman bluez bluez-utils btop ttf-jetbrains-mono-nerd hyprsunset
# AUR (après yay)
yay -S zen-browser-bin vscodium-bin hyprshot rofi-rbw nordvpn-bin claude-code
```
*(Les noms AUR bougent — vérifier au moment de l'install.)*
