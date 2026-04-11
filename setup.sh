#!/bin/bash
echo
echo "🔗 Creating symlinks..."
echo

DOTFILES_DIR="$HOME/.dotfiles"
LINK_COUNT=0    # symlinks created/overwritten
SKIPPED_COUNT=0 # symlinks skipped

create_symlink() {
    local src="$1"
    local dest="$2"

    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "➜ $dest already correctly symlinked, skipping."
        ((LINK_COUNT++))
    elif [ -e "$dest" ]; then
        echo
        echo "❗$dest exists but is not the expected symlink."
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

# All config files that are in the root of the HOME directory
# Zsh config
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Tmux config
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# skhd config
create_symlink "$DOTFILES_DIR/.skhdrc" "$HOME/.skhdrc"

# git-hooks folder symlink
create_symlink "$DOTFILES_DIR/.git-hooks" "$HOME/.git-hooks"

# All the config files that are placed inside the .config folder
# Create .config folder if missing
mkdir -p "$HOME/.config"

# starship config
create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

# ghostty config
mkdir -p "$HOME/.config/ghostty"
create_symlink "$DOTFILES_DIR/ghostty.config" "$HOME/.config/ghostty/config"
create_symlink "$DOTFILES_DIR/Ghostty.icns" "$HOME/.config/ghostty/Ghostty.icns"

# karabiner config
mkdir -p "$HOME/.config/karabiner"
create_symlink "$DOTFILES_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# aerospace config
mkdir -p "$HOME/.config/aerospace"
create_symlink "$DOTFILES_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"

#Personal scripts folder
mkdir -p "$HOME/.local" # make sure parent exists
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
