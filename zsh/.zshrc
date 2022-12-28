# Oh my zsh options
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git sudo zoxide macos vi-mode)

source $ZSH/oh-my-zsh.sh

# Aliases
alias c=clear
alias cls=clear

alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -a --icons"
alias lla="exa -al --icons"
alias tree="exa -T --icons"

alias cat="bat"

alias vi="nvim"

# Make vi (Neovim) the default text editor
export EDITOR="vi"

# Autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Kitty specific options
if [[ $TERM = "xterm-kitty" ]]; then
    alias icat="kitty +kitten icat"
    alias kdiff="kitty +kitten diff"
    alias kssh="kitty +kitten ssh"
    alias khints="kitty +kitten hints"
    alias ktransfer="kitty +kitten transfer"
    alias kbroadcast="kitty +kitten broadcast"
    alias kclipboard="kitty +kitten clipboard"
    alias kpaste="kitty +kitten clipboard --get-clipboard"
fi

# Starship prompt
eval "$(starship init zsh)"

