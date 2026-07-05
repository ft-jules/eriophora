short() {
    # Text Color Codes (256-Color Palette for Grading)
    
    # Kitty (Pink Palette)
    local K_TTL="\e[1;38;5;161m" # Dark Pink (Title)
    local K_SUB="\e[1;38;5;162m" # Medium Pink (Section)
    local K_TXT="\e[38;5;205m"   # Bright Pink (Text)

    # System (Orange Palette)
    local S_TTL="\e[1;38;5;130m" # Dark Orange/Brown (Title)
    local S_SUB="\e[1;38;5;166m" # Medium Orange (Section)
    local S_TXT="\e[38;5;208m"   # Bright Orange (Text)

    # Zsh (Blue Palette)
    local Z_TTL="\e[1;38;5;25m"  # Dark Blue (Title)
    local Z_SUB="\e[1;38;5;31m"  # Medium Blue (Section)
    local Z_TXT="\e[38;5;39m"    # Bright Light Blue (Text)

    # Custom Aliases (Green Palette)
    local RC_TTL="\e[1;38;5;22m" # Dark Green (Title)
    local RC_SUB="\e[1;38;5;28m" # Medium Green (Section)
    local RC_TXT="\e[38;5;46m"   # Bright Green (Text)
    
    local RST="\e[0m"            # Reset Color

    if [[ "$1" == "kitty" ]]; then
        # Bright Pink output for Kitty
        echo -e "${K_TTL}=== Kitty Terminal Shortcuts (Full Config) ===${RST}"
        
        echo -e "\n${K_SUB}[ System ]${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+F5         : Reload Kitty Configuration${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+C          : Copy to Clipboard${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+V          : Paste from Clipboard${RST}"

        echo -e "\n${K_SUB}[ Tabs (Macro Movement) ]${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+T          : New Tab${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+W          : Close Tab${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+Left       : Previous Tab${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+Right      : Next Tab${RST}"
        echo -e "${K_TXT}  Alt+1..9              : Go to Tab 1..9${RST}"
        
        echo -e "\n${K_SUB}[ Splits (Micro Movement - Vim Style) ]${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+E          : Vertical Split (Left/Right)${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+O          : Horizontal Split (Top/Bottom)${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+H          : Move Focus Left${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+J          : Move Focus Down${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+K          : Move Focus Up${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+L          : Move Focus Right${RST}"
        
        echo -e "\n${K_SUB}[ Scrolling & Selection ]${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+Up         : Scroll History Line Up${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+Down       : Scroll History Line Down${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+PgUp       : Scroll History Page Up${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+PgDn       : Scroll History Page Down${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+P > F      : Hint Copy (File Path)${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+P > W      : Hint Copy (Word)${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+P > L      : Hint Copy (Line)${RST}"
        echo -e "${K_TXT}  Ctrl+Shift+P > U      : Hint Copy (URL)${RST}"
        echo ""

    elif [[ "$1" == "sys" ]]; then
        # Dark Orange output for System
        echo -e "${S_TTL}=== System Shortcuts (Ubuntu/GNOME) ===${RST}"
        
        # echo -e "\n${S_SUB}[ Custom Ubuntu Shortcuts ]${RST}"
        # echo -e "${S_TXT}  Super + E             : Open File Explorer (Example)${RST}"
        # echo -e "${S_TXT}  Custom Key            : Custom Action${RST}"
        
        echo -e "\n${S_SUB}[ Window Management ]${RST}"
        echo -e "${S_TXT}  Super + W             : Close window${RST}"
        echo -e "${S_TXT}  Super + D             : Show Desktop (Minimize All)${RST}"
        echo -e "${S_TXT}  Super + F             : Toggle fullscreen mode${RST}"
        echo -e "${S_TXT}  Super + H             : Minimize current window${RST}"
        echo -e "${S_TXT}  Super + Left/Right    : Snap Window Left/Right${RST}"
        echo -e "${S_TXT}  Super + Up/Down       : Maximize/Restore Window${RST}"
        echo -e "${S_TXT}  Ctrl + Space          : Activate window menu${RST}"
        echo -e "${S_TXT}  Alt + Tab             : Switch between Applications${RST}"
        echo -e "${S_TXT}  Alt + \` (Grave)      : Switch between windows of same app${RST}"
        echo -e "${S_TXT}  Super + PgUp/PgDn     : Switch Workspaces${RST}"
        echo -e "${S_TXT}  Shift+Super+PgUp/PgDn : Move window to another Workspace${RST}"
        echo -e "${S_TXT}  Shift+Super+Arrows    : Move window to another Monitor${RST}"
        
        echo -e "\n${S_SUB}[ System Controls ]${RST}"
        echo -e "${S_TXT}  Super + L             : Lock Screen${RST}"
        echo -e "${S_TXT}  Super + Return        : Open a New Terminal Window${RST}"
        echo -e "${S_TXT}  Super + Ctrl + Return : Open a New Floating Terminal Window${RST}"
        echo -e "${S_TXT}  Super + Shift + Return: Open a New Web Browser Window${RST}"
        echo -e "${S_TXT}  PrtSc                 : Take a full screenshot${RST}"
        echo -e "${S_TXT}  Alt + Space           : Launch Ulauncher${RST}"
        echo -e "${S_TXT}  Super + I             : Open Settings${RST}"
        echo -e "${S_TXT}  Super + A             : Open Applications Menu${RST}"
        echo -e "${S_TXT}  Super + S             : Open Activity Overview${RST}"
        echo -e "${S_TXT}  Super + C             : Run command...${RST}"
        
        echo -e "\n${S_SUB}[ Text Editing (GUI) ]${RST}"
        echo -e "${S_TXT}  Ctrl + A              : Select All${RST}"
        echo -e "${S_TXT}  Ctrl + C              : Copy${RST}"
        echo -e "${S_TXT}  Ctrl + X              : Cut${RST}"
        echo -e "${S_TXT}  Ctrl+Shift+V / Ctrl+V : Paste${RST}"
        echo -e "${S_TXT}  Ctrl + Z / Y          : Undo / Redo${RST}"
        echo ""

    elif [[ "$1" == "zsh" ]]; then
        # Blue output for Oh My Zsh
        echo -e "${Z_TTL}=== Oh My Zsh Shell Shortcuts (Comprehensive) ===${RST}"
        
        echo -e "\n${Z_SUB}[ Cursor Movement ]${RST}"
        echo -e "${Z_TXT}  Ctrl+A / Home         : Go to start of line${RST}"
        echo -e "${Z_TXT}  Ctrl+E / End          : Go to end of line${RST}"
        echo -e "${Z_TXT}  Alt+F / Alt+Right     : Move forward one word${RST}"
        echo -e "${Z_TXT}  Alt+B / Alt+Left      : Move backward one word${RST}"

        echo -e "\n${Z_SUB}[ Text Editing & Deletion ]${RST}"
        echo -e "${Z_TXT}  Ctrl+W                : Delete previous word (Cut)${RST}"
        echo -e "${Z_TXT}  Alt+D                 : Delete next word (Cut)${RST}"
        echo -e "${Z_TXT}  Ctrl+U                : Delete to start of line (Cut)${RST}"
        echo -e "${Z_TXT}  Ctrl+K                : Delete to end of line (Cut)${RST}"
        echo -e "${Z_TXT}  Ctrl+Y                : Paste the last cut text${RST}"

        echo -e "\n${Z_SUB}[ Text Manipulation ]${RST}"
        echo -e "${Z_TXT}  Ctrl+T                : Swap current and previous character${RST}"
        echo -e "${Z_TXT}  Alt+U/L/C             : Uppercase/Lowercase/Capitalize word${RST}"

        echo -e "\n${Z_SUB}[ History & Process Control ]${RST}"
        echo -e "${Z_TXT}  Ctrl+R                : Search command history (Reverse)${RST}"
        echo -e "${Z_TXT}  Ctrl+L                : Clear screen (keep current command)${RST}"
        echo -e "${Z_TXT}  Ctrl+C                : Cancel current running command${RST}"
        
        # Green output for .zshrc Custom Aliases
        echo -e "\n${RC_TTL}=== ~/.zshrc Custom Commands & Aliases ===${RST}"
        echo -e "${RC_TXT}  short                 : Display cheat sheet (args: kitty, sys, zsh)${RST}"
        echo -e "${RC_TXT}  source ~/.zshrc       : Reload shell configuration${RST}"
        echo -e "${RC_TXT}  rg                    : Ranger${RST}"
        echo -e "${RC_TXT}  c                     : Clear${RST}"
        
        echo -e "\n${RC_SUB}[ Your Custom Aliases ]${RST}"
        # Dynamically scan .zshrc for any line starting with 'alias' and print it
        grep -E "^\s*alias" ~/.zshrc | while read -r line; do
            clean_alias=$(echo "$line" | sed 's/^[ \t]*alias //')
            echo -e "${RC_TXT}  $clean_alias${RST}"
        done
        echo ""

    else
        # Default help menu
        echo -e "Usage: \e[1mshort [argument]\e[0m"
        echo -e "  ${K_TTL}short kitty${RST} : Display exhaustive Kitty terminal shortcuts (Bright Pink)"
        echo -e "  ${S_TTL}short sys${RST}   : Display exhaustive system shortcuts (Orange)"
        echo -e "  ${Z_TTL}short zsh${RST}   : Display comprehensive shell shortcuts (Blue/Green)"
        echo ""
    fi
}
