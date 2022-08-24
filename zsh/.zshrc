# Oh my zsh options
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(z git)

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

# Starship prompt
eval "$(starship init zsh)"

