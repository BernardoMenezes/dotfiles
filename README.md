# Dotfiles

Personal configuration files for vim, zsh, and Claude Code.

## Setup on a new computer

Clone this repository and create symlinks:

```bash
git clone git@github.com:BernardoMenezes/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
mkdir -p ~/.claude
ln -s ~/dotfiles/claude-settings.json ~/.claude/settings.json
ln -s ~/dotfiles/claude-memory ~/.claude/shared-memory

# Per-repo memory symlinks (shared across repo copies)
for suffix in solid solid_2 solid_3 solid_4; do
  mkdir -p ~/.claude/projects/-Users-b-Github-${suffix}
  ln -s ~/.claude/shared-memory/solid ~/.claude/projects/-Users-b-Github-${suffix}/memory
done
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
- `claude-settings.json` - Claude Code settings (permissions and hooks)
- `iterm-tab-name.sh` - Sets iTerm2 tab title to project directory name on Claude Code session start
- `claude-memory/` - Persistent Claude Code memory, shared across repo copies (solid, solid_2, etc.)
