# zshrc — eriophora
# Repris d'Ubuntu, sans oh-my-zsh (cf vault : Migration Ubuntu → Arch §1).

export EDITOR=nvim
export PATH="$HOME/eriophora/bin:$HOME/.local/bin:$PATH"

# --- Historique ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups share_history

# --- Complétion ---
autoload -Uz compinit && compinit

# --- Alias ---
alias c='clear'
alias docker=podman
alias kconf="$EDITOR ~/.config/kitty/kitty.conf"

# --- Fonction perso : mémo raccourcis (short kitty|sys|zsh|rc) ---
[ -f "$HOME/eriophora/bin/short.zsh" ] && source "$HOME/eriophora/bin/short.zsh"

# --- Plugins (paquets pacman) ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# --- Prompt ---
command -v starship >/dev/null && eval "$(starship init zsh)"

# --- fastfetch au lancement (kitty uniquement) ---
[ "$TERM" = "xterm-kitty" ] && command -v fastfetch >/dev/null && fastfetch
