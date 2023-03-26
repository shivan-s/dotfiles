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
eval /Users/shivan/miniconda3/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<

# Python set up
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx DJANGO_DEVELOPMENT 1
set -gx PIPENV_VENV_IN_PROJECT 1
set -gx PYRIGHT_PYTHON_FORCE_VERSION latest

# Go set up
set -x GOPATH $HOME/Projects/go/
fish_add_path /$GOPATH/bin
alias go="grc go"
alias godev="cd $HOME/Projects/go/src/github.com/shivan-s/"

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
alias gi="git add . && git commit -m 'init' && git push"
alias fishconfig="$EDITOR $HOME/.dotfiles/fish/config.fish"

# sync dotfiles
function dotfileupdate
    set -f commit_message updating...
    if count $argv >/dev/null
        set -f commit_message $argv
    end
    cd $HOME/.dotfiles/
    git add -A
    git commit -m "$commit_message"
    git push
    cd -
end

# Sourcing functions
function swapempty
    rm "$HOME/.local/share/nvim/swap/*"
end

# zk
set -gx ZK_NOTEBOOK_DIR $HOME/Notes/

# pipenv completions
eval (env _PIPENV_COMPLETE=fish_source pipenv)

# FZF
set -gx FZF_DEFAULT_OPTS "--layout=reverse --preview=bat"

# starship
# TODO: lookj into this
# starship init fish | source

# pnpm
set -gx PNPM_HOME "/Users/shivan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end