#!/bin/bash

set -x

ORIGINAL_DIR=$(pwd)

# .tmux
cd ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# may fix this later to make links
cp .tmux.conf ~
cp .tmux.conf.local ~

sudo apt update && sudo apt -y install zsh tmux

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# apply zshrc
cp .zshrc ~/

# powerline fonts
if [ -f /etc/os_release ] && [ $(grep -E "[Dd]ebian|Ubuntu" /etc/os_release) ]; then
    sudo apt install fonts-powerline
fi

# powerlevel9k theme for oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# git clone https://github.com/caiogondim/bullet-train.zsh
# cp bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/themes/
cp powerlevel9k.zsh-theme ~/.oh-my-zsh/custom/themes/powerlevel9k/

cd ${ORIGINAL_DIR}

# TODO: setup golang
