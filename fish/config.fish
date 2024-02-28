# Dotfiles
set -gx DOTFILES ~/dotfiles
set -gx FISH $DOTFILES/fish

# Dev-specific
set -gx CONDA $HOME/miniconda3
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin

# OS-specific
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
end

# Opts and flags
set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#797593,bg:#faf4ed,hl:#d7827e
	--color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
	--color=border:#dfdad9,header:#286983,gutter:#faf4ed
	--color=spinner:#ea9d34,info:#56949f,separator:#dfdad9
	--color=pointer:#907aa9,marker:#b4637a,prompt:#797593
    --height 40% --no-info --layout=reverse"

# Init agent
eval (ssh-agent -c) >/dev/null

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $CONDA/bin/conda
    eval $CONDA/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "$CONDA/etc/fish/conf.d/conda.fish"
        . "$CONDA/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "$CONDA/bin" $PATH
    end
end
function __conda_add_prompt; end
# <<< conda initialize <<<

# Source functions
source $FISH/functions/git.fish
source $FISH/functions/misc.fish
source $FISH/functions/hooks.fish

fish_config theme choose "rosepine"

# Init zoxide
zoxide init fish --hook pwd --cmd j | source
