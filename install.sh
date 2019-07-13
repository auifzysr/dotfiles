#!/bin/bash

set -x

ORIGINAL_DIR=$(pwd)

# .tmux
cd ~
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

sudo apt -y install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerline fonts
if [ -f /etc/os_release ] && [ $(grep -E "[Dd]ebian" /etc/os_release) ]; then
    sudo apt install fonts-powerline
fi

# powerlevel9k theme for oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/caiogondim/bullet-train.zsh
cp bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/themes/

cd $(ORIGINAL_DIR)
