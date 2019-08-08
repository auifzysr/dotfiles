# Contents
## Zsh
- [Powerline](https://github.com/powerline/fonts)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- [.tmux](https://github.com/gpakosz/.tmux)
- [powerlevel9k](https://github.com/bhilburn/powerlevel9k)
## Emacs
See details on .emacs.d/init.el.

## Notes
- Some system's default fonts do not work with Powerline9k since they do not have triangle characters. Change the system font to like "Monospace Regular" which include those characters.
- If a character on the terminal is illegible, change the color theme of it.
- When browsing `.tmux.conf.local`, do not scroll the file down to the bottom using `C->` otherwise the content display goes wrong somehow.
- Overwrite the powerlevel9k definition to `~/.oh-my-zsh/custom/themes` to configure the current directory indicator's color.
- To enable it for root, `sudo ln -sf $HOME/.zshrc /root/.zshrc` and `sudo chsh`