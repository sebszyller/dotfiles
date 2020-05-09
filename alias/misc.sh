# Linux-specific
# alias open="xdg-open"
# alias here="nautilus . &"
# alias clpb="xclip -selection clipboard"
alias clpb=pbcopy
alias cl=clear
alias cp="cp -v"
alias d='dirs -v | head -10'
alias g="rg --color=always -i"
alias l="ls"
alias l1="l -1"
alias la="ls -a"
alias lah="ls -lah"
alias ll="ls -al"
alias py=python3
alias scr="screen -r"
alias scx="screen -XS"
alias scls="screen -ls"
alias t="tree -L 1"
alias tt="tree -L 2"
alias ttt="tree -L 3"
alias shrug="echo \"¯\_(ツ)_/¯ copied to clipboard\" && echo -n \"¯\_(ツ)_/¯\" | clpb"
alias today="date -u +"%Y%m%d""
alias v=vim
alias yeet="rm -fr"
alias ytdl="youtube-dl"
alias ytdlb="ytdl -f best"

ccat() { pygmentize -g $1 }

function cd_overwrite() {
	\cd $1 && ls
}
alias cd="cd_overwrite"

psf() { ps aux | fzf | awk '{ print $2 }' | tr -d "\n" | clpb }

hist() { fc -l 1 | sort -rn | awk '{ $1=""; print $0 }' | sed "s/^ //" | fzf | tr -d "\n" | clpb }

ff() { greadlink -f $(rg --color=never --line-number . | fzf --no-multi --delimiter : --preview "bat --color=always --line-range {2}: {1}" | awk -F: '{ print $1 }') | tr -d "\n" | clpb }

texcomp() { pdflatex -synctex=1 -interaction=nonstopmode --shell-escape $1 }
