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

# Work aliases and funcs that aren't meant to go into my public repo
if [ -f ~/.dev-config/local/work_aliases.sh ]; then
  . ~/.dev-config/local/work_aliases.sh
fi

if [ -f ~/.dev-config/local/work_exports.sh ]; then
  . ~/.dev-config/local/work_exports.sh
fi

if [ -f ~/.dev-config/local/work_funcs.sh ]; then
  . ~/.dev-config/local/work_funcs.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

