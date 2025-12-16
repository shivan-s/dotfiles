#!/usr/bin/env bash

ln -sf $(pwd)/nvim $HOME/.config/
ln -sf $(pwd)/alacritty $HOME/.config/
ln -sf $(pwd)/newsboat $HOME/.config/
ln -sf $(pwd)/fish $HOME/.config/
ln -sf $(pwd)/omf $HOME/.config/
ln -sf $(pwd)/.tmux.conf $HOME/
ln -sf $(pwd)/.tmux.conf.local $HOME/
ln -sf $(pwd)/sql-language-server $HOME/.config/
mkdir -p $HOME/.config/pgcli
ln -sf $(pwd)/pgcli/config $HOME/.config/pgcli/config
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
