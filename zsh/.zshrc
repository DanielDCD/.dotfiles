# Autoinstall antidote
if ! type antidote &> /dev/null; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote &> /dev/null
fi

# Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

# Aliases
alias c=clear
alias cls=clear

if command -v eza &> /dev/null; then
    alias ls="eza --icons"
    alias ll="eza -l --icons"
    alias la="eza -a --icons"
    alias lla="eza -al --icons"
    alias tree="eza -T --icons"
fi

if command -v bat &> /dev/null; then
    alias cat="bat"
fi

if command -v nvim &> /dev/null; then
    alias vi="nvim"
fi

if command -v rg &> /dev/null; then
    alias grep="rg"
fi

# Zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# fzf
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi"

# Make vi (Neovim) the default text editor
export EDITOR="vi"

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
