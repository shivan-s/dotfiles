function fish_greeting
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

# Fish commands
alias rm="rm -i"
alias cp="cp -i"
alias firefox="open -a firefox"
alias vim="nvim"
alias psql="pgcli"
abbr --add t "tmux"
abbr --add lg "lazygit"
abbr --add v "nvim"
abbr --add zs "zk standup" # for work
abbr --add norg "nvim -c :Neorg"
abbr --add today "nvim -c ':Neorg journal today'"
abbr --add journal "nvim -c ':Neorg journal'"
abbr --add la "eza -la --git -s modified -r --icons --header"
abbr --add ls "eza -a --icons -s modified --group-directories-first"
abbr --add tree "eza -T --git-ignore --icons"
abbr --add gia "git add"
abbr --add gic "git commit -m '"
abbr --add gip "git pull"
abbr --add gp "git push"
abbr --add gich "git checkout"
abbr --add gil "git log --oneline"
abbr --add gif "git fetch"
abbr --add ff "open -a firefox"
abbr --add fishc "$EDITOR $HOME/.dotfiles/fish/config.fish"
abbr --add fs "source $HOME/.config/fish/config.fish"
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

# flutter
fish_add_path $HOME/development/flutter/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
# alr
fish_add_path /usr/local/bin/alr


# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions --query __zoxide_cd_internal
    string replace --regex -- '^function cd\s' 'function __zoxide_cd_internal ' <$__fish_data_dir/functions/cd.fish | source
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    if set -q __zoxide_loop
        builtin echo "zoxide: infinite loop detected"
        builtin echo "Avoid aliasing `cd` to `z` directly, use `zoxide init --cmd=cd fish` instead"
        return 1
    end
    __zoxide_loop=1 __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z
    set -l argc (builtin count $argv)
    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if test $argc -eq 2 -a $argv[1] = --
        __zoxide_cd -- $argv[2]
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions.
function __zoxide_z_complete
    set -l tokens (builtin commandline --current-process --tokenize)
    set -l curr_tokens (builtin commandline --cut-at-cursor --current-process --tokenize)

    if test (builtin count $tokens) -le 2 -a (builtin count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        complete --do-complete "'' "(builtin commandline --cut-at-cursor --current-token) | string match --regex -- '.*/$'
    else if test (builtin count $tokens) -eq (builtin count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (command zoxide query --exclude (__zoxide_pwd) --interactive -- $query)
        and __zoxide_cd $result
        and builtin commandline --function cancel-commandline repaint
    end
end
complete --command __zoxide_z --no-files --arguments '(__zoxide_z_complete)'

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query --interactive -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

abbr --erase z &>/dev/null
alias z=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually
# ~/.config/fish/config.fish):
#
#   zoxide init fish | source
