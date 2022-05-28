set -gx fish_greeting 'Welcome!'
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /$HOME/.local/bin $PATH

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
status --is-interactive; and pyenv virtualenv-init - | source

set -gx CLICOLOR 1
set -gx LSCOLORS Exfxcxdxbxegedabagacad

fish_add_path /opt/homebrew/opt/node@16/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/shivan/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Python set up
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx DJANGO_DEVELOPMENT yes

# Go set up
alias go="grc go"

# set -gx TERM xterm-256color

# Fish commands
alias la="ls -alt"
alias rm="rm -i"
alias cp="cp -i"
alias firefox="open -a firefox"
alias vim="nvim"
