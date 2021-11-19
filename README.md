# dotfiles

These are my dotfiles that I use on MacOS

## Set up

To clone the repository, ensure you are in the home directory.

```shell
git clone git@github.com:ShivanS93/dotfiles.git
```

Move into a hidden file to make things look nice.

```shell
mv ~/dotfiles ~/.dotfiles
```

## Requirements

- fish
- oh my fish
- vim
- tmux

### Installing fish

```shell 
# linux
sudo apt-get install fish
fish
chsh -s /usr/bin/fish

# macOS
brew install fish
# TODO: need to add more
```

### Installing oh my fish

Source: https://github.com/oh-my-fish/oh-my-fish

Run:

```shell
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

I am using bobthefish for my main machine (Source: https://github.com/oh-my-fish/theme-bobthefish)

I am using default for servers.

## Installing tmux

```shell
sudo apt install tmux

# creating symlinks
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
```

## Installing vim

First we install Vundle, a pluging manager for vim.

Source: https://github.com/VundleVim/Vundle.vim

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
