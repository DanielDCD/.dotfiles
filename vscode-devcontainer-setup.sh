#!/bin/zsh

# Install utilites
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
curl -sS https://starship.rs/install.sh | sh
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Remove default files
rm ~/.zshrc
rm ~/.config/starhip.toml
rm -rf ~/.config/bat

# Copy dotfiles
cp zsh/.zshrc ~/.zshrc
cp zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
cp starship/.config/starship.toml ~/.config/starship.toml
cp bat/.config/bat ~/.config/bat
