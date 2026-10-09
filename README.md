<div align="center">

# ⚡ .dotfiles

**Opinionated, keyboard-driven macOS development environment.**  
Crafted for speed, aesthetics, and seamless workflows — leaving Linux in the dust.

<p align="center">
  <a href="https://apple.com"><img src="https://img.shields.io/badge/macOS-Golden%20Gate-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS" /></a>&nbsp;
  <a href="https://brew.sh"><img src="https://img.shields.io/badge/Packages-Homebrew-FBB040?style=for-the-badge&logo=homebrew&logoColor=white" alt="Homebrew" /></a>&nbsp;
  <a href="https://github.com/nikitabobko/AeroSpace"><img src="https://img.shields.io/badge/WM-AeroSpace-0284c7?style=for-the-badge" alt="AeroSpace" /></a>
  <br>
  <a href="https://github.com/koekeishiya/skhd"><img src="https://img.shields.io/badge/Hotkeys-skhd-2f3542?style=for-the-badge" alt="skhd" /></a>&nbsp;
  <a href="https://karabiner-elements.pqrs.org/"><img src="https://img.shields.io/badge/Remap-Karabiner-5c5edc?style=for-the-badge" alt="Karabiner Elements" /></a>&nbsp;
  <a href="https://ghostty.org/"><img src="https://img.shields.io/badge/Ghostty-Terminal-24292e?style=for-the-badge&logo=ghostty&logoColor=white" alt="Ghostty" /></a>
  <br>
  <a href="https://starship.rs/"><img src="https://img.shields.io/badge/Zsh-Starship-f59e0b?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Zsh + Starship" /></a>&nbsp;
  <a href="https://neovim.io"><img src="https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white" alt="Neovim" /></a>&nbsp;
  <a href="https://github.com/tmux/tmux"><img src="https://img.shields.io/badge/tmux-3.x-10b981?style=for-the-badge&logo=tmux&logoColor=white" alt="tmux" /></a>
</p>

</div>

---

## 📑 Table of Contents

- [Overview](#-overview)
- [The Stack](#-the-stack)
- [Repository Structure](#-repository-structure)
- [Installation Guide](#-installation-guide)
  - [1. Clone Repository](#1-clone-repository)
  - [2. Install Dependencies (`install.sh`)](#2-install-dependencies-installsh)
  - [3. Symlink Configurations (`setup.sh`)](#3-symlink-configurations-setupsh)
- [Cheat Sheet & Keybindings](#-cheat-sheet--keybindings)
  - [Hyper Key App Launcher](#-hyper-key-app-launcher-skhd--karabiner)
  - [AeroSpace Window Management](#-aerospace-window-manager)
  - [tmux Cheatsheet](#-tmux)
- [Quick Reload Commands](#-quick-reload-commands)

---

## 🔭 Overview

This repository contains my personal configurations for a fast, minimal, and fully keyboard-driven developer environment on macOS.

### Key Highlights

- 🪟 **Tiling Window Management**: Seamless window manipulation and multi-monitor workspace switching via [AeroSpace](https://github.com/nikitabobko/AeroSpace).
- 🚀 **Hyper Key Launcher**: Dedicated Hyper key (`Cmd + Ctrl + Shift + Alt` mapped to Right Command via Karabiner) for instant app switching via [skhd](https://github.com/koekeishiya/skhd).
- 🖥️ **Modern Terminal & Shell**: [Ghostty](https://ghostty.org/) GPU terminal with a warm dark Gruvbox palette, paired with Zsh vi-mode and the blazing fast [Starship](https://starship.rs/) prompt.
- 🪟 **Multiplexing with tmux**: Vi keybindings, custom minimalist status bar, and clipboard integration (rarely used now since AeroSpace handles tiling and workspaces natively).
- 📦 **Automated Setup**: Declarative Homebrew package management via `Brewfile`, dry-run capable `install.sh`, and interactive, safe symlinking via `setup.sh`.

---

## 🛠️ The Stack

| Component           | Tool                                                                    | Description                                                               |
| :------------------ | :---------------------------------------------------------------------- | :------------------------------------------------------------------------ |
| **Window Manager**  | [AeroSpace](https://github.com/nikitabobko/AeroSpace)                   | i3-inspired tiling window manager for macOS                               |
| **Hotkey Daemon**   | [skhd](https://github.com/koekeishiya/skhd)                             | Fast hotkey daemon mapped to application shortcuts                        |
| **Key Remapper**    | [Karabiner-Elements](https://karabiner-elements.pqrs.org/)              | Maps Right Command to the universal Hyper Key                             |
| **Terminal**        | [Ghostty](https://ghostty.org/)                                         | Fast, native GPU terminal with 0xProto Nerd Font & blur                   |
| **Shell**           | [Zsh](https://zsh.sourceforge.io/)                                      | Vi mode, syntax autosuggestions, autocompletions                          |
| **Prompt**          | [Starship](https://starship.rs/)                                        | Minimalist, cross-shell prompt with rich status icons                     |
| **Editors**         | [Neovim](https://neovim.io) / [VS Code](https://code.visualstudio.com/) | Modal editing, custom settings, and keymaps                               |
| **Package Manager** | [Homebrew](https://brew.sh/)                                            | Formulae, casks, and fonts defined in `Brewfile`                          |
| **Multiplexer**     | [tmux](https://github.com/tmux/tmux)                                    | Custom dark status line, vi copy mode (optional / secondary to AeroSpace) |

---

## 📁 Repository Structure

The `setup.sh` script maps configurations in this repository to their respective paths:

| File / Folder              | Target Location                            | Description                                       |
| :------------------------- | :----------------------------------------- | :------------------------------------------------ |
| `ghostty.config`           | `~/.config/ghostty/config`                 | Ghostty terminal layout, theme, and font settings |
| `Ghostty.icns`             | `~/.config/ghostty/Ghostty.icns`           | Custom Ghostty application icon                   |
| `aerospace/aerospace.toml` | `~/.config/aerospace/aerospace.toml`       | AeroSpace layouts, workspace bindings, and rules  |
| `karabiner/karabiner.json` | `~/.config/karabiner/karabiner.json`       | Karabiner profile and Hyper key modification      |
| `starship.toml`            | `~/.config/starship.toml`                  | Starship prompt layout and module symbols         |
| `.zshrc`                   | `~/.zshrc`                                 | Shell environment, aliases, and tool paths        |
| `.tmux.conf`               | `~/.tmux.conf`                             | tmux keybindings, prefix, and status bar setup    |
| `.skhdrc`                  | `~/.skhdrc`                                | Global hotkeys and launcher commands              |
| `vscode/`                  | `~/Library/Application Support/Code/User/` | VS Code `settings.json` and `keybindings.json`    |
| `Brewfile`                 | —                                          | Declarative list of Homebrew formulae and casks   |

---

## 🚀 Installation Guide

> [!NOTE]
> Review `install.sh` and `setup.sh` before running to verify that they match your system preferences.

### 1. Clone Repository

```bash
git clone https://github.com/jonatanwestling/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Dependencies (`install.sh`)

Installs Homebrew (if not present), taps required repositories, and installs all CLI tools, GUI casks, and fonts from `Brewfile`.

```bash
# Preview actions without executing (Dry Run)
./install.sh --dry

# Run the complete installation
./install.sh
```

### 3. Symlink Configurations (`setup.sh`)

Creates all symbolic links safely. If a target configuration already exists, you will be prompted before anything is overwritten:

```bash
chmod +x setup.sh
./setup.sh
```

---

## ⌨️ Cheat Sheet & Keybindings

<details open>
<summary><b>✨ Hyper Key App Launcher (skhd + Karabiner)</b></summary>
<br>

> **Hyper** = <kbd>Cmd</kbd> + <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Alt</kbd> (mapped to `Right Command`)

| Shortcut                                            | Action                                    |
| :-------------------------------------------------- | :---------------------------------------- |
| <kbd>Hyper</kbd> + <kbd>Return</kbd> / <kbd>T</kbd> | Open **Ghostty** terminal                 |
| <kbd>Hyper</kbd> + <kbd>B</kbd>                     | Open **Zen Browser**                      |
| <kbd>Hyper</kbd> + <kbd>S</kbd>                     | Open **Safari**                           |
| <kbd>Hyper</kbd> + <kbd>C</kbd>                     | Open **Gemini**                           |
| <kbd>Hyper</kbd> + <kbd>M</kbd>                     | Open **Spotify**                          |
| <kbd>Hyper</kbd> + <kbd>D</kbd>                     | Open **Discord**                          |
| <kbd>Hyper</kbd> + <kbd>A</kbd>                     | Open **Antigravity IDE**                  |
| <kbd>Hyper</kbd> + <kbd>V</kbd>                     | Open **Visual Studio Code**               |
| <kbd>Hyper</kbd> + <kbd>F</kbd>                     | Open **Finder**                           |
| <kbd>Hyper</kbd> + <kbd>P</kbd>                     | Open **Preview**                          |
| <kbd>Hyper</kbd> + <kbd>N</kbd>                     | Open **Notes**                            |
| <kbd>Hyper</kbd> + <kbd>E</kbd>                     | Open **ExcalidrawZ**                      |
| <kbd>Hyper</kbd> + <kbd>G</kbd>                     | Search clipboard content on Google in Zen |

</details>

<details open>
<summary><b>🪟 AeroSpace Window Manager</b></summary>
<br>

| Shortcut                                                                                      | Action                                         |
| :-------------------------------------------------------------------------------------------- | :--------------------------------------------- |
| <kbd>Cmd</kbd> + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd>                    | Focus Left / Down / Up / Right                 |
| <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd> | Move window Left / Down / Up / Right           |
| <kbd>Cmd</kbd> + <kbd>Ctrl</kbd> + <kbd>H</kbd> / <kbd>L</kbd>                                | Smart resize window (-50 / +50)                |
| <kbd>Cmd</kbd> + <kbd>1</kbd> .. <kbd>9</kbd>                                                 | Switch to workspace 1–9                        |
| <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> .. <kbd>9</kbd>                              | Move focused window to workspace 1–9           |
| <kbd>Alt</kbd> + <kbd>Tab</kbd>                                                               | Switch between previous/current workspace      |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>Tab</kbd>                                            | Move workspace to next monitor                 |
| <kbd>Alt</kbd> + <kbd>F</kbd>                                                                 | Toggle fullscreen                              |
| <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd>                                              | Toggle floating / tiling layout                |
| <kbd>Cmd</kbd> + <kbd>.</kbd>                                                                 | Switch layout: Tiles (horizontal/vertical)     |
| <kbd>Cmd</kbd> + <kbd>,</kbd>                                                                 | Switch layout: Accordion (horizontal/vertical) |

</details>

<details>
<summary><b>💻 tmux</b></summary>
<br>

> [!NOTE]
> I don't use tmux that much anymore since AeroSpace handles tiling and workspaces natively across my entire setup, but the configuration is kept here whenever session persistence is needed.

> **Prefix** = <kbd>Ctrl</kbd> + <kbd>Space</kbd>

| Shortcut                             | Action                                              |
| :----------------------------------- | :-------------------------------------------------- |
| <kbd>Prefix</kbd> then <kbd>r</kbd>  | Reload tmux configuration                           |
| <kbd>Prefix</kbd> then <kbd>v</kbd>  | Enter copy mode (vi keybindings)                    |
| In copy mode: <kbd>y</kbd>           | Yank selection to macOS clipboard (`pbcopy`)        |
| <kbd>Prefix</kbd> then <kbd>k</kbd>  | Prompt to kill tmux server                          |
| <kbd>Ctrl</kbd> + <kbd>h/j/k/l</kbd> | Seamless vim-tmux navigation (`vim-tmux-navigator`) |

</details>

---

## 🔄 Quick Reload Commands

Whenever modifying configuration files on the fly, apply changes instantly without restarting your terminal or session:

```bash
# Reload AeroSpace configuration
aerospace reload-config

# Reload skhd hotkeys
skhd --reload

# Reload tmux configuration
tmux source-file ~/.tmux.conf
# or inside tmux: Prefix + r

# Reload Zsh shell
source ~/.zshrc
```

---

<div align="center">
  <sub>Maintained by <a href="https://github.com/jonatanwestling">Jonatan</a></sub>
</div>
