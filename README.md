# Dotfiles

Personal configuration files for vim and zsh.

## Setup on a new computer

Clone this repository and create symlinks:

```bash
git clone git@github.com:BernardoMenezes/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
```

Install vim-plug (the Vim plugin manager):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install Vim plugins:

```bash
vim +PlugInstall +qall
```

## Files

- `vimrc` - Vim configuration
- `zshrc` - Zsh shell configuration
