set -gx fish_greeting ''
set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH /$HOME/.local/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

set -gx CLICOLOR 1
set -gx LSCOLORS Exfxcxdxbxegedabagacad

fish_add_path /opt/homebrew/opt/node@16/bin



