function fish_greeting
    echo Hello $USER,
    echo The time is (set_color green; date +%T; set_color normal)
end

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
status --is-interactive; and pyenv virtualenv-init - | source

set -gx CLICOLOR 1
set -gx LSCOLORS Exfxcxdxbxegedabagacad

fish_add_path /opt/homebrew/opt/node@16/bin
fish_add_path /opt/homebrew/bin
fish_add_path /$HOME/.local/bin
fish_add_path /$HOME/.cargo/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/shivan/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Python set up
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx DJANGO_DEVELOPMENT yes

# Go set up
set -x GOPATH $HOME/Projects/go/
alias go="grc go"
alias godev="cd $HOME/Projects/go/src/github.com/shivan-s/"
fish_add_path /$GOPATH/bin

# kubectl
alias kubectl="minikube kubectl --"

# glow
set -gx EDITOR nvim

# set -gx TERM xterm-256color

# Fish commands
alias la="ls -alh"
alias rm="rm -i"
alias cp="cp -i"
alias firefox="open -a firefox"
alias vim="nvim"
alias rvim="vim"
alias gi="git add . && git commit -m 'init' && git push"
alias fishconfig="$EDITOR $HOME/.dotfiles/fish/config.fish"

# Sourcing functions
function swapempty
  rm "$HOME/.local/share/nvim/swap/*"
end

# zk
set -gx ZK_NOTEBOOK_DIR $HOME/Notes/

