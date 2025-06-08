#!/bin/bash

echo "🔗 Creating symlinks..."

DOTFILES_DIR="$HOME/.dotfiles"

create_symlink() {
  local src="$1"
  local dest="$2"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "➜ $dest already correctly symlinked, skipping."
  elif [ -e "$dest" ]; then
    echo "❗ $dest exists but is not the expected symlink. Please backup or remove it."
    exit 1
  else
    ln -s "$src" "$dest"
    echo "✔ Created symlink: $dest → $src"
  fi
}

# Zsh config
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Tmux config
create_symlink "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# skhd config
create_symlink "$DOTFILES_DIR/.skhdrc" "$HOME/.skhdrc"

# Create .config folder if missing
mkdir -p "$HOME/.config"

# starship config
create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

# git-hooks folder symlink
create_symlink "$DOTFILES_DIR/.git-hooks" "$HOME/.git-hooks"

echo "✅ Dotfiles installed successfully."
