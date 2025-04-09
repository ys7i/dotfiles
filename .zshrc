# power level 10k
source "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.p10k.zsh

## alias
alias dc="docker-compose"
alias dcl="docker-compose logs -f --tail=200"
alias gst="git status"
alias gpull="git pull"
alias gcm="git commit"
alias gad="git add"
alias gche="git checkout"
alias gpush="git push"
alias python='python3'
alias pip='pip3'

## oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_DISABLE_COMPFIX="true"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# jump command
eval "$(jump shell)"