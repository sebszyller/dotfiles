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
