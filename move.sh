#!/usr/bin/env bash

ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/alacritty $HOME/.config/
ln -sf $(pwd)/fish $HOME/.config/fish
ln -sf $(pwd)/omf $HOME/.config/omf
ln -sf $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sf $(pwd)/.tmux.conf.local $HOME/.tmux.conf.local
ln -sf $(pwd)/sql-language-server $HOME/.config/sql-language-server

mkdir $HOME/.zk
ln -sf $(pwd)/zk/templates $HOME/.zk/templates
ln -sf $(pwd)/zk/.config $HOME/.zk/.config

git config --global push.autoSetupRemote true
