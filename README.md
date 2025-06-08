# .dotfiles

This repository contains the dotfiles for my personal development environment setup. These configuration files are tailored to streamline workflows and enhance productivity on my system.

## Features
- Configuration files for various tools and utilities.
- Easy-to-use setup script for creating symlinks.
- Instructions for manual reloading of specific tools like `skhd`.

## Good Stuff
- Reload `skhd` manually by running:
  ```bash
  skhd --reload
  ```

## Setup Instructions
To set up the dotfiles on your system, follow these steps:

1. **Make the setup script executable**:
   ```bash
   chmod +x setup.sh
   ```

2. **Run the setup script** to create symlinks:
   ```bash
   ./setup.sh
   ```

## Notes
- Review the `setup.sh` script before running to understand the symlinks it creates.
