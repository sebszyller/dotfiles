if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux-specific
    echo "Initialising aliases for Linux."
    alias open="xdg-open"
    alias here="nautilus . &"
    alias clpb="xclip -selection clipboard"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    echo "Initialising aliases for MacOS."
    alias clpb=pbcopy
else
    echo ">>>>>>>> WARN: Shell initialised on an unexpected OS type: $($OSTYPE)"
fi

alias cl=clear
alias cp="cp -v"
alias d='dirs -v | head -10'
alias g="rg --color=always -i"
alias l="ls"
alias l1="l -1"
alias la="ls -a"
alias lah="ls -lah"
alias ll="ls -al"
alias nrs="npm run serve"
alias nrb="npm run build"
alias py=python3
alias t="tree -L 1"
alias tt="tree -L 2"
alias ttt="tree -L 3"
alias shrug="echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | clpb"
alias today="date -u +"%Y%m%d""
alias v=vim
alias yeet="rm -fr"
alias ytdl="youtube-dl"
alias ytdlb="ytdl -f best"

hash -d downl=~/Downloads
hash -d desk=~/Desktop
hash -d dot=~/dotfiles

function cd_overwrite() {
	\cd $1 && ls
}
alias cd="cd_overwrite"

cenv() { conda activate $(cat ~/.conda/environments.txt | fzf) }

ff() { greadlink -f $(rg --color=never --line-number . | fzf --no-multi --delimiter : --preview "bat --color=always --line-range {2}: {1}" | awk -F: '{ print $1 }') | tr -d "\n" | clpb }

hist() { fc -l 1 | sort -rn | awk '{ $1=""; print $0 }' | sed "s/^ //" | fzf | tr -d "\n" | clpb }

psf() { ps aux | fzf | awk '{ print $2 }' | tr -d "\n" | clpb }

scr() { screen -r $(screen -ls | fzf | awk '{ print $1 }' | cut -f1 -d".") }

scx() {
    local sid=$(screen -ls | fzf | awk '{ print $1 }' | cut -f1 -d".")
    screen -XS $sid quit
    echo "Killed session $sid."
}

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

