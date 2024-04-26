set --local fmt '--pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'

alias ga "git add"
alias gb "git branch"
alias gc "git checkout"
alias gcm "git commit"
alias gdf "git diff"
alias gdfc "git diff --cached"
alias gl "clear; git log --oneline $fmt"
alias glg "clear; git log --graph $fmt"
alias glp "clear; git log -p $fmt"
alias gls "clear; git log --stat $fmt"
alias gpull "git pull"
alias gpush "git push"
alias pchaj "git push"
alias gr "git reset"
alias grh "git reset --hard"
alias grs "git reset --soft"
alias gru "git remote update"
alias gs "git status"
alias gst "git stash"
alias gsta "git stash apply"
alias gti "git"

function gsh
    clear
    set --local sha (eval "git log --oneline $fmt --color=always" | fzf --ansi --no-sort | awk '{print $1}')

    if test -z "$sha"
        kill -INT $fish_pid
    else
        git show $fmt --color=always --decorate $sha
    end
end
