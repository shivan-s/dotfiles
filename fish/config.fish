function fish_greeting
    echo Hello $USER,
    echo The time is (set_color green; date +%T; set_color normal)
end

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
status --is-interactive; and pyenv virtualenv-init - | source

set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx LSCOLORS Exfxcxdxbxegedabagacad

fish_add_path /opt/homebrew/opt/node@16/bin
fish_add_path /opt/homebrew/bin
fish_add_path /$HOME/.local/bin
fish_add_path /$HOME/.cargo/bin
fish_add_path /opt/homebrew/opt/libpq/bin

# psql
set -gx LDFLAGS -L/opt/homebrew/opt/libpq/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/libpq/include

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

# Fish commands
alias rm="rm -i"
alias cp="cp -i"
alias firefox="open -a firefox"
alias vim="nvim"
alias psql="pgcli"
abbr --add t tmux
abbr --add v nvim
abbr --add la "ls -alh"
abbr --add ex "exa -a --icons -s modified --group-directories-first"
abbr --add ea "exa -la --git -s modified -r --icons --header"
abbr --add et "exa -T --git-ignore --icons"
abbr --add gia "git add"
abbr --add gic "git commit -m '"
abbr --add gip "git pull"
abbr --add gp "git push"
abbr --add gich "git checkout"
abbr --add gil "git log --oneline"
abbr --add gif "git fetch"
abbr --add firefox "open -a firefox"
abbr --add fishconfig "$EDITOR $HOME/.dotfiles/fish/config.fish"
abbr --add fishso "source $HOME/.config/fish/config.fish"
abbr --add vimconfig "$EDITOR $HOME/.dotfiles/nvim/"

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
set -gx ZK_NOTEBOOK_DIR $HOME/notes

# pipenv completions
eval (env _PIPENV_COMPLETE=fish_source pipenv)

# FZF
set -gx FZF_DEFAULT_OPTS "--layout=reverse --preview=bat"

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# Racket
fish_add_path /Applications/Racket/bin/
