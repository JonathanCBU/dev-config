alias zedit="nvim ~/.dev-config; source ~/.zshrc"
alias vedit="nvim ~/.config/nvim"
alias conf="nvim ~/.dev-config; source ~/.zshrc"
alias ls="ls -h --color"
alias ll="ls --color -la"

## k8s
alias k="kubectl"
alias k9s='k9s -c pods -n "$(kubens -c 2>/dev/null || echo default)"'
