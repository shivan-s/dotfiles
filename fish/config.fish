set -gx fish_greeting ''
set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH /$HOME/.local/bin:$PATH

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

set -gx CLICOLOR 1
set -gx LSCOLORS Exfxcxdxbxegedabagacad
