#!/bin/bash -x

cd ~
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
exit 0
