#!/bin/bash
set -euo pipefail

DRY_RUN=false
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

if [[ "${1:-}" == "--dry" ]]; then
    DRY_RUN=true
fi

run() {
    if $DRY_RUN; then
        echo "[dry-run] $*"
    else
        eval "$@"
    fi
}

echo "Starting install..."

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Homebrew not found. Installing..."
    run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Make brew available in this shell after install
    if [[ -x /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    else
        echo "❌ Homebrew seems installed, but brew was not found in the expected location."
        exit 1
    fi
else
    echo "✔ Homebrew already installed"
fi

echo "🔄 Updating Homebrew..."
run brew update

# Optional if your Brewfile already contains the tap
echo "🍺 Tapping required repositories..."
run brew tap nikitabobko/tap

# Install everything from Brewfile
if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
    echo "📦 Installing packages from Brewfile..."
    run brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo "⚠️ No Brewfile found at $DOTFILES_DIR/Brewfile"
fi

echo
echo "✅ Installation completed successfully!"
echo
