#!/bin/bash -xe

cd ~
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [ -f /etc/os_release ] && [ $(grep -E "[Dd]ebian" /etc/os_release) ]; then
    sudo apt install fonts-powerline
fi

exit 0
