# OS-specific inits.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux-specific
    echo "Initialising aliases for Linux."
    alias open="xdg-open"
    alias here="nautilus . &"
    alias clip="xclip -selection clipboard"
    alias readlinkorgreadlink=readlink
    alias wcorgwc=wc
    alias sedorgsed=sed
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "Initialising aliases for MacOS."
    alias clip=pbcopy
    alias readlinkorgreadlink=greadlink
    alias wcorgwc=gwc
    alias sedorgsed=gsed
else
    echo ">>>>>>>> WARN: Shell initialised on an unexpected OS type: $($OSTYPE)"
fi

# Check if commands exist
cmd_exists() { type $1 &> /dev/null || { echo "WARN: $1 not found" } }

cmds=(bat delta eza fd fzf jc jq npm nvim pdflatex poetry pyenv rg)
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
alias nrs="npm run serve"
alias nrb="npm run build"
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

# Lookip hostname and id.
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
    read "sname?Session name: "
    tmux new -s $sname
}

# Fuzzy-find for killing a tmux session
tmx() {
    local sname=$(tmux ls | __fzfselectorexit | awk '{ print $1 }' | tr -d ':')
    tmux kill-session -t $sname
    echo "Killed session $sname."
}

# Fuzzy-find directories on the stack
sf() { cd "$(dirs -p | __fzfselectorexit | sedorgsed "s|~|${HOME}|")" }

# Compile latex file
texcomp() { pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $1 }

# Fuzzy-find for tsp outputs
tspf() { cat $(tsp | __fzfselectorexit | awk '{print $3}') }

# Create and manage directory tabs (with fuzzy finding)
tab() {
    local tabfile="${HOME}/.tab/tablist"
    local usage="tab [-h] [-a path] [-d] -- simple tab keeping util.
    By default, tab list is stored in $tabfile

Options:
  -h        Show this help text.
  -a path   Add tab.
  -d        Remove tab."

    # Create tab file if it doesn't exist yet
    if [ ! -e "$tabfile" ] ; then
        echo "Tab file doesn't exist. Creating in $tabfile"
        mkdir -p ${HOME}/.tab/ && touch $tabfile
        return 0
    fi

    # Find tab if no argument provided
    if (($# == 0)); then
        if [ -s "$tabfile" ]; then
            cd "$(cat $tabfile | __fzfselectorexit)"
        else
            echo "$tabfile is empty..."
        fi
    fi

    # -a to add a new tab; -d to remove one
    while (( $# >= 1 )); do
        case $1 in
        -h) echo "$usage" ;
            break ;;
        -a) local resolved=$(readlinkorgreadlink -f $2) ;
            echo $resolved >> $tabfile ;
            sort -o $tabfile $tabfile ;
            break ;;
        -d) local line="$(cat $tabfile | __fzfselectorexit)" ;
            sedorgsed -i "\|${line}$|d" $tabfile ;
            break ;;
        *) break;
        esac;
        shift
    done
}

__fzfselectorexit() {
    local input="$([[ -p /dev/stdin ]] && cat - || echo "$@")"
    local selected=$(echo "$input" | fzf --ansi --no-sort)

    if [[ "$selected" == "" ]]; then
        kill -INT $$
    else
        echo $selected
    fi
}
