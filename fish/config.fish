set -gx fish_greeting 'Welcome!'

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
set -x GOPATH $HOME/go
alias go="grc go"
fish_add_path /$GOPATH/bin

# kubectl
alias kubectl="minikube kubectl --"

# set -gx TERM xterm-256color

# Fish commands
alias la="ls -al"
alias rm="rm -i"
alias cp="cp -i"
alias firefox="open -a firefox"
alias vim="nvim"
alias rvim="vim"
alias gi="git add . && git commit -m 'init' && git push"

# Sourcing functions
function swapempty
  rm "$HOME/.local/share/nvim/swap/*"
end

# zk
set -gx ZK_NOTEBOOK_DIR $HOME/Notes/
