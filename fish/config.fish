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
	--color=fg:#908caa,hl:#ebbcba
	--color=fg+:#e0def4,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
    --height 40% --no-info --layout=reverse"

# Init agent
eval (ssh-agent -c) >/dev/null

# Source functions
source $FISH/functions/git.fish
source $FISH/functions/misc.fish
source $FISH/functions/hooks.fish

fish_config theme choose "rosepine"

# Init zoxide
zoxide init fish --hook pwd --cmd j | source

