# OS-specific inits.
switch (uname)
    case Linux
        # echo "Initialising aliases for Linux."
        alias open "xdg-open"
        alias here "nautilus . &"
        alias clip "xclip -selection clipboard"
        alias readlinkorgreadlink "readlink"
        alias wcorgwc "wc"
        alias sedorgsed "sed"
    case Darwin
        # echo "Initialising aliases for MacOS."
        alias clip "pbcopy"
        alias readlinkorgreadlink "greadlink"
        alias wcorgwc "gwc"
        alias sedorgsed "gsed"
    case '*'
        echo ">>>>>>>> WARN: Shell initialised on an unexpected OS type: (uname)"
end

# Check if commands exist
function cmd_exists
    if not type -q $argv[1]
        echo "WARN: $argv[1] not found"
    end
end

set --local cmds bat delta eza fd fzf jc jq npm nvim pdflatex rg zoxide
for c in $cmds
    cmd_exists $c
end

# # Aliases
if type -q eza
    alias ls eza
end

alias bat "bat --theme=gruvbox-light"
alias cp "cp -v"
alias g "rg --color=always -i"
alias l "ls"
alias l1 "ls -1"
alias la "ls -a"
alias ll "ls -al"
alias t "eza --tree -L 1"
alias tt "eza --tree -L 2"
alias ttt "eza --tree -L 3"
alias shrug "echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | clip"
alias today "date -u +"%Y%m%d""
alias tmls "tmux ls"
alias v "nvim"
alias vv "nvim ."
alias xx "xargs"

# Scripts & functions
# Fuzzy-find conda environemnts
function cenv
    conda activate (ls -1 $CONDA/envs/ | __fzfselectorexit)
end

# Check if/what is listening on the port
function chport
    lsof -Pi :$argv[1] -sTCP:LISTEN
end

# Fuzzy finder for file names
function ff
    if count $argv > /dev/null
        set --function pathtosearch $argv[1]
    else
        set --function pathtosearch (pwd)
    end

    fd -tf -tl -a "" $pathtosearch | __fzfselectorexit
end

# Fuzzy-find history
function hf
    set --function choice (history | __fzfselectorexit)
    echo $choice
    echo -n $choice | clip
end

# Lookup hostname and id.
function me
    echo Hostname: (hostname)
    echo ID: (whoami)
end

# Fuzzy-find from psf aux
function psf
    set --function choice (ps aux | __fzfselectorexit | awk '{ print $2 }')
    echo $choice
    echo -n $choice | clip
end

# Fuzzy-find for reconnecting to a tmux session
function tma
    set --function sessions (tmux ls)
    if test (count $sessions) -eq 1
        tmux attach
    else
        tmux attach -t (printf %s\n $sessions | __fzfselectorexit | awk '{ print $1 }' | tr -d ':')
    end
end

# Create a new named tmux session
function tmnew
    if count $argv > /dev/null
        set --function sname $argv[1]
    else
        read --prompt-str="Session name: " -f sname
    end
    tmux new -s $sname
end

# Fuzzy-find for killing a tmux session
function tmx
    set --function sname (tmux ls | __fzfselectorexit | awk '{ print $1 }' | tr -d ':')
    tmux kill-session -t $sname
    echo Killed session $sname.
end

# Fuzzy-find directories on the stack
function sf
    j (printf %s\n $dirprev | __fzfselectorexit)
end

function take
    mkdir $argv[1]
    j $argv[1]
end

# Compile latex file
function texcomp
    pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $argv[1]
end

# Fuzzy-find for tsp outputs
function tspf
    cat (tsp | __fzfselectorexit | awk '{print $3}')
end

# Fuzzy-find file and open with (n)vim
function vf
    v (fd -tf --hidden --exclude '.git/' | __fzfselectorexit)
end

function __fzfselectorexit
    read -z -f input
    set --local selected (printf %s $input | fzf --ansi)

    if test -z "$selected"
        kill -INT $fish_pid
    else
        echo $selected
    end
end
