#!/bin/bash

install_libraries() { 
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

   if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        install_on_linux
        chsh -s $(which zsh)
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        install_on_mac
    fi
}

install_on_linux() {
    sudo apt install zsh
    wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_0.51.0_amd64.deb && sudo dpkg -i jump_0.51.0_amd64.deb
}

install_on_mac() {
    # Homebrewのインストール確認とインストール
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install --cask slack
    brew install clipy
    brew install --cask cursor
    brew install vim
    brew install jump
}