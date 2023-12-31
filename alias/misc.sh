# OS-specific inits.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # echo "Initialising aliases for Linux."
    alias open="xdg-open"
    alias here="nautilus . &"
    alias clip="xclip -selection clipboard"
    alias readlinkorgreadlink=readlink
    alias wcorgwc=wc
    alias sedorgsed=sed
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # echo "Initialising aliases for MacOS."
    alias clip=pbcopy
    alias readlinkorgreadlink=greadlink
    alias wcorgwc=gwc
    alias sedorgsed=gsed
else
    echo ">>>>>>>> WARN: Shell initialised on an unexpected OS type: $($OSTYPE)"
fi

# Check if commands exist
cmd_exists() { type $1 &> /dev/null || { echo "WARN: $1 not found" } }

local cmds=(bat delta eza fd fzf jc jq npm nvim pdflatex rg zoxide)
for c in $cmds
do
    cmd_exists $c
done

# Aliases
if type eza &> /dev/null; then
    alias ls=eza
fi

alias cp="cp -v"
alias d='dirs -v | head -10'
alias g="rg --color=always -i"
alias l="ls"
alias l1="ls -1"
alias la="ls -a"
alias ll="ls -al"
alias obsidian="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/knowledge-base"
alias t="eza --tree -L 1"
alias tt="eza --tree -L 2"
alias ttt="eza --tree -L 3"
alias shrug="echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | clip"
alias today="date -u +"%Y%m%d""
alias tmls="tmux ls"
alias v=nvim
alias xx=xargs

alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE

# Scripts & functions
# Fuzzy-find conda environemnts
cenv() { conda activate $(ls -1 $CONDA/envs/ | __fzfselectorexit) }

# Check if/what is listening on the port
chport() { lsof -Pi :$1 -sTCP:LISTEN }

# Fuzzy finder for file names
ff() {
    local pathtosearch
    if (($# == 0)); then
        pathtosearch=$(pwd)
    else
        pathtosearch=$1
    fi

    fd -tf -tl -a "" $pathtosearch | __fzfselectorexit
}

# Fuzzy-find history
hf() {
    local choice=$(fc -l 1 | sort -rn | awk '{ $1=""; print $0 }' | sedorgsed "s/^ //" | __fzfselectorexit)
    echo $choice
    echo -n $choice | clip
}

# Lookup hostname and id.
me() {
    echo "Hostname: $(hostname)"
    echo "ID: $(whoami)$"
}

# Fuzzy-find from psf aux
psf() {
    local choice=$(ps aux | __fzfselectorexit | awk '{ print $2 }')
    echo $choice
    echo -n $choice | clip
}

# Fuzzy-find for reconnecting to a tmux session
tma() {
    local sessions=$(tmux ls)
    if (($(echo $sessions | wc -l) == 1)); then
        tmux attach
    else
        tmux attach -t $(echo $sessions | __fzfselectorexit | awk '{ print $1 }' | tr -d ':')
    fi
}

# Create a new named tmux session
tmnew() {
    if (($# == 0)); then
        read "sname?Session name: "
    else
        local sname=$1
    fi
    tmux new -s $sname
}

# Fuzzy-find for killing a tmux session
tmx() {
    local sname=$(tmux ls | __fzfselectorexit | awk '{ print $1 }' | tr -d ':')
    tmux kill-session -t $sname
    echo "Killed session $sname."
}

# Fuzzy-find directories on the stack
sf() { z "$(dirs -p | __fzfselectorexit | sedorgsed "s|~|${HOME}|")" }

# Compile latex file
texcomp() { pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $1 }

# Fuzzy-find for tsp outputs
tspf() { cat $(tsp | __fzfselectorexit | awk '{print $3}') }

# Fuzzy-find file and open with (n)vim
vf() { v $(fd -tf --hidden --exclude '.git/' | __fzfselectorexit) }

__fzfselectorexit() {
    local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
    local selected=$(echo "$input" | fzf --ansi)

    if [[ "$selected" == "" ]]; then
        kill -INT $$
    else
        echo $selected
    fi
}
