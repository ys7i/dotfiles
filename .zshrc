## setup functions
setup_dotfiles() {
  echo "Setting up dotfiles..."

  # Install libraries
  echo "Installing oh-my-zsh and plugins..."
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  )

ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"
source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
if command -v jump &> /dev/null; then
    eval "$(jump shell)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
if [ -d "$HOME/.rbenv" ]; then
    eval "$(rbenv init - zsh)"
fi

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi