if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux-specific
    echo "Initialising aliases for Linux."
    alias open="xdg-open"
    alias here="nautilus . &"
    alias clip="xclip -selection clipboard"
    alias readlinkorgreadlink=readlink
    alias wcorgwc=wc
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "Initialising aliases for MacOS."
    alias clip=pbcopy
    alias readlinkorgreadlink=greadlink
    alias wcorgwc=gwc
else
    echo ">>>>>>>> WARN: Shell initialised on an unexpected OS type: $($OSTYPE)"
fi

cmd_exists() { type $1 &> /dev/null || { echo "WARN: $1 not found" } }

cmds=(bat delta fd fzf jc jq npm nvim pdflatex poetry pyenv rg tree)
echo "Checking if commands exist."
for c in $cmds
do
    cmd_exists $c
done

alias cp="cp -v"
alias d='dirs -v | head -10'
alias g="rg --color=always -i"
alias l="ls"
alias l1="ls -1"
alias la="ls -a"
alias lah="ls -lah"
alias ll="ls -al"
alias nrs="npm run serve"
alias nrb="npm run build"
alias obsidian="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/knowledge-base"
alias t="tree -L 1"
alias tt="tree -L 2"
alias ttt="tree -L 3"
alias shrug="echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | clip"
alias today="date -u +"%Y%m%d""
alias v=nvim
alias yeet="rm -fr"

alias history="history 1"
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE

cenv() { conda activate $(cat ~/.conda/environments.txt | fzf) }

hf() {
    local choice=$(fc -l 1 | sort -rn | awk '{ $1=""; print $0 }' | sed "s/^ //" | fzf)
    echo $choice
    echo -n $choice | clip
}

me() {
    echo "Hostname: $(hostname)"
    echo "ID: $(whoami)$"
}

psf() {
    local choice=$(ps aux | fzf | awk '{ print $2 }')
    echo $choice
    echo -n $choice | clip
}

scr() { screen -r $(screen -ls | tail -n +2 | sed -e '$d' | sed -e '$d' | fzf | awk '{ print $1 }' | cut -f1 -d".") }

scx() {
    local sid=$(screen -ls | tail -n +2 | sed -e '$d' | sed -e '$d' | fzf | awk '{ print $1 }' | cut -f1 -d".")
    screen -XS $sid quit
    echo "Killed session $sid."
}

sf() { cd $(dirs -p | fzf | sed "s|~|${HOME}|") }

sitecheck() {
    echo "Pinging..."
    ping -c 5 sebszyller.com

    echo "Digging apex..."
    dig sebszyller.com +nostats +nocomments +nocmd

    echo "Digging www..."
    dig www.sebszyller.com +nostats +nocomments +nocmd
}

texcomp() { pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $1 }

tspf() { cat $(tsp | fzf | awk '{print $3}') }
