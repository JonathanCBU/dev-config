# Simple zsh config that I augment from time to time
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -f ~/.dev-config/local/exports.sh ]; then
  . ~/.dev-config/local/exports.sh
fi

if [ -f ~/.dev-config/local/aliases.sh ]; then
  . ~/.dev-config/local/aliases.sh
fi

if [ -f ~/.dev-config/local/funcs.sh ]; then
  . ~/.dev-config/local/funcs.sh
fi
