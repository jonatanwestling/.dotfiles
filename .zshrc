# General locale for English
export LANG=en_US.UTF-8
# Swedish-specific settings for regional preferences
export LC_COLLATE="sv_SE.UTF-8"      # Sorting rules
export LC_MEASUREMENT="sv_SE.UTF-8"  # Metric units
export LC_PAPER="sv_SE.UTF-8"        # A4 paper size
export LC_TIME="sv_SE.UTF-8"         # Date and time format

# This is for git auto complete
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit
compinit

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim="nvim"
alias vi="nvim"

# Use Vim keybindings in Zsh
bindkey -v

# STARSHIP
eval "$(starship init zsh)"

# OH_MY_ZSH
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# plugins=(git)
#source $ZSH/oh-my-zsh.sh

export CLICOLOR=1
export LSCOLORS=HxfxCxDxBxegedabagacad

# Paths
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="$HOME/.local/scripts:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/Applications/MATLAB_R2024b.app/bin:$PATH"


# Created by `pipx` on 2025-07-03 19:34:05
export PATH="$PATH:/Users/jonatanwestling/.local/bin"
# Added by Antigravity
export PATH="/Users/jonatanwestling/.antigravity/antigravity/bin:$PATH"
