# Oh my zsh options
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git sudo zoxide macos vi-mode)

source $ZSH/oh-my-zsh.sh

# Aliases
alias c=clear

alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -a --icons"
alias lla="exa -al --icons"
alias tree="exa -T --icons"

alias cat="bat"

alias vi="nvim"

# Autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Starship prompt
eval "$(starship init zsh)"

