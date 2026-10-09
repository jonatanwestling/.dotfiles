#!/bin/bash
echo
echo "🔗 Creating symlinks..."
echo

DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
LINK_COUNT=0    # symlinks created/overwritten
SKIPPED_COUNT=0 # symlinks skipped

create_symlink() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "➜ $dest already correctly symlinked, skipping."
        ((LINK_COUNT++))
    elif [ -L "$dest" ]; then
        # Update outdated or broken symlink
        rm -f "$dest"
        ln -s "$src" "$dest"
        echo "✔ Updated symlink: $dest → $src"
        ((LINK_COUNT++))
    elif [ -e "$dest" ]; then
        echo
        echo "❗$dest exists but is not a symlink."
        read -p "❗Do you want to overwrite it? [y/N] " answer
        case "$answer" in
        [Yy]*)
            rm -rf "$dest"
            ln -s "$src" "$dest"
            echo
            echo "✔ Overwritten: $dest → $src"
            ((LINK_COUNT++))
            ;;
        *)
            echo
            echo "➜ Skipped: $dest"
            ((SKIPPED_COUNT++))
            ;;
        esac
    else
        ln -s "$src" "$dest"
        echo "✔ Created symlink: $dest → $src"
        ((LINK_COUNT++))
    fi
}

# --- Home directory dotfiles ---
# Zsh config
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Tmux config
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# skhd config
create_symlink "$DOTFILES_DIR/skhd/.skhdrc" "$HOME/.skhdrc"

# git-hooks folder symlink
create_symlink "$DOTFILES_DIR/.git-hooks" "$HOME/.git-hooks"

# --- ~/.config directories ---
mkdir -p "$HOME/.config"

# Starship prompt config
create_symlink "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# Ghostty terminal config & custom icon
mkdir -p "$HOME/.config/ghostty"
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
create_symlink "$DOTFILES_DIR/ghostty/Ghostty.icns" "$HOME/.config/ghostty/Ghostty.icns"

# Karabiner-Elements config
mkdir -p "$HOME/.config/karabiner"
create_symlink "$DOTFILES_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# AeroSpace tiling window manager config
mkdir -p "$HOME/.config/aerospace"
create_symlink "$DOTFILES_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

# --- VS Code configuration ---
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_USER_DIR"
create_symlink "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
create_symlink "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

# --- Personal scripts folder ---
mkdir -p "$HOME/.local"
create_symlink "$DOTFILES_DIR/scripts" "$HOME/.local/scripts"

echo
echo "🔗 Summary:"
echo "✔ Total links correctly set up: $LINK_COUNT"
echo "➜ Total links skipped by user: $SKIPPED_COUNT"
echo

if [ "$SKIPPED_COUNT" -eq 0 ]; then
    echo "✅ Dotfiles installed successfully."
else
    echo "⚠️ Some links were skipped. Review skipped items above."
fi
