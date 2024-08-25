# Dotfiles
set -gx DOTFILES ~/dotfiles
set -gx FISH $DOTFILES/fish

# Dev-specific
set -gx PYTHON_INSTALLS /Library/Frameworks/Python.framework/Versions
set -gx PIP_REQUIRE_VIRTUALENV true
fish_add_path $PYTHON_INSTALLS/3.11/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin

# OS-specific
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
end

# Opts and flags
set -gx EDITOR nvim
set -Ux FZF_DEFAULT_OPTS "
    --color=fg:#b4bdc3,bg:-1,hl:#6099c0
    --color=fg+:#b4bdc3,bg+:#3d4042,hl+:#61abda
    --color=info:#b77e64,prompt:#66a5ad,pointer:#b77e64
    --color=marker:#819b69,spinner:#b279a7,header:#66a5ad
    --color=separator:-1,border:-1,gutter:-1
    --height 40% --no-info --no-scrollbar --no-separator
    --prompt='~ ' --pointer='+ ' --layout=reverse"

bind \cx "clear-screen"

# Init agent
eval (ssh-agent -c) >/dev/null

# Source functions
source $FISH/functions/git.fish
source $FISH/functions/misc.fish
source $FISH/functions/hooks.fish
source $FISH/themes/zenbones.fish

# Init zoxide
zoxide init fish --hook pwd --cmd j | source

