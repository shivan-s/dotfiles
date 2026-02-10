#!/usr/bin/env bash

ln -sf $(pwd)/nvim $HOME/.config/

ln -sf $(pwd)/alacritty $HOME/.config/

ln -sf $(pwd)/newsboat $HOME/.config/

ln -sf $(pwd)/fish $HOME/.config/

ln -sf $(pwd)/.wezterm.lua $HOME/

mkdir -p $HOME/.config/tmux
ln -sf $(pwd)/tmux.conf $HOME/.config/tmux/
mkdir -p $HOME/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git $HOME/.config/tmux/plugins/catppuccin/tmux

ln -sf $(pwd)/.gitconfig $HOME/.config/

mkdir -p $HOME/.config/lazygit
ln -sf $(pwd)/lazygit/config.yml $HOME/.config/lazygit

mkdir -p $HOME/.config/pgcli
ln -sf $(pwd)/pgcli/config $HOME/.config/pgcli/config

ln -sf $(pwd)/opencode.jsonc $HOME/.config/opencode/
ln -sf $(pwd)/AGENTS.md $HOME/.config/opencode/

ln -sf $(pwd)/zk $HOME/.config/zk

ln -sf $(pwd)/.gitconfig $HOME/.gitconfig

ln -sf $(pwd)/gotz $HOME/.config/gotz
