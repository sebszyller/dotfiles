# OS-specific inits.
switch (uname)
    case Linux
        # echo "Initialising aliases for Linux."
        alias open "xdg-open"
        alias here "nautilus . &"
        alias yy "xclip -selection clipboard"
        alias readlinkorgreadlink "readlink"
        alias wcorgwc "wc"
        alias sedorgsed "sed"
    case Darwin
        # echo "Initialising aliases for MacOS."
        alias yy "pbcopy"
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

alias bat "bat --theme=ansi"
alias cp "cp -v"
alias g "rg --color=always -i"
alias l "ls"
alias l1 "ls -1"
alias la "ls -a"
alias ll "ls -al"
alias t "eza --tree -L 1"
alias tt "eza --tree -L 2"
alias ttt "eza --tree -L 3"
alias shrug "echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | yy"
alias today "date -u +"%Y%m%d""
alias tmls "tmux ls"
alias v "nvim"
alias vv "nvim ."
alias xx "xargs"
alias vac ". .venv/bin/activate.fish"
alias poetry ".venv/bin/poetry"

# Scripts & functions

# Check if/what is listening on the port
function chport
    lsof -Pi :$argv[1] -sTCP:LISTEN
end

# Fuzzy finder for file names
function ff
    argparse 'a/absolute' -- $argv
    if set -q _flag_absolute
        alias fd "fd -a"
    end

    if count $argv > /dev/null
        set --function pattern $argv[1]
        set --function results (fd --full-path -tf -tl --hidden --exclude '.git' --exclude '.venv' $pattern)
        if test (count $results) -eq 1
            set --function choice $results[1]
        else
            set --function choice (fd -tf -tl --hidden --exclude '.git' --exclude '.venv' | __fzfselectorexit --query=$pattern)
        end
    else
        set --function choice (fd -tf -tl --hidden --exclude '.git/' --exclude '.venv' | __fzfselectorexit)
    end
    functions -e fd
    echo -n $choice
end

# Fuzzy-find history
function hf
    set --function choice (history | __fzfselectorexit)
    echo -n $choice
end

# Lookup hostname and id.
function me
    echo Hostname: (hostname)
    echo ID: (whoami)
end

# Fuzzy-find from psf aux
function psf
    set --function choice (ps aux | __fzfselectorexit | awk '{ print $2 }')
    echo -n $choice
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
    echo Killed session $sname
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
function tss
    ts -c (ts | __fzfselectorexit | awk '{print $1}')
end

# Fuzzy-find for killing tsp jobs
function tsk
    set --function jobid (ts | __fzfselectorexit | awk '{print $1}')
    ts -k $jobid
    echo Killed job id:$jobid
end

# Fuzzy-find file and open with (n)vim
function vf
    v (ff $argv)
end

function __fzfselectorexit
    argparse "q/query=" -- $argv
    if set -q _flag_query
        set --function query $_flag_query
    else
        set --function query
    end

    read -z -f input
    set --local choice (printf %s $input | fzf --ansi --query=$query)

    if test -z "$choice"
        kill -INT $fish_pid
    else
        echo $choice
    end
end
