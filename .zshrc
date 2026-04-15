## setup functions
setup_dotfiles() {
  echo "Setting up dotfiles..."

  # Install libraries
  echo "Installing oh-my-zsh and plugins..."
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --keep-zshrc
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

  # Install jump
  echo "Installing jump..."
  if command -v brew &> /dev/null; then
    brew install jump
  elif [[ "$(uname)" == "Linux" ]]; then
    ARCH=$(uname -m)
    [[ "$ARCH" == "aarch64" ]] && ARCH="arm" || ARCH="amd64"
    JUMP_VER=$(curl -sf https://api.github.com/repos/gsamokovarov/jump/releases/latest | grep '"tag_name"' | head -1 | sed 's/.*"v\([^"]*\)".*/\1/')
    if [[ -z "$JUMP_VER" ]]; then
      echo "Failed to get jump version. Skipping jump install."
    else
      if curl -fsSL "https://github.com/gsamokovarov/jump/releases/download/v${JUMP_VER}/jump_linux_${ARCH}_binary" -o /tmp/jump; then
        sudo install -m 755 /tmp/jump /usr/local/bin/jump
        rm -f /tmp/jump
        echo "jump installed successfully."
      else
        echo "Failed to download jump."
        rm -f /tmp/jump
      fi
    fi
  fi
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
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/ys7i/.bun/_bun" ] && source "/Users/ys7i/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
