set --global __gitfmt '--pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'

alias ga "git add"
alias gap "git add -p"
alias gb "git branch"
alias gc "git checkout"
alias gcm "git commit"
alias gdf "git diff"
alias gdfc "git diff --cached"
alias glp "clear; git log -p --show-signature $__gitfmt"
alias gls "clear; git log --stat --show-signature $__gitfmt"
alias gpull "git pull"
alias gpush "git push"
alias pchaj "git push"
alias gr "git reset"
alias grh "git reset --hard"
alias grs "git reset --soft"
alias gru "git remote update"
alias grb "git rebase"
alias grbi "git rebase --interactive"
alias gs "git status"
alias gst "git stash"
alias gsta "git stash apply"
alias gti "git"

function gl
    clear
    set --local sha (eval "git log --oneline $__gitfmt --color=always" $argv[1] | fzf --ansi --no-sort --height=80% --preview="git show --show-signature --color=always $__gitfmt --stat {1}" | awk '{print $1}')

    if test -z "$sha"
        kill -INT $fish_pid
    else
        git show --show-signature $__gitfmt --show-signature --color=always --decorate $sha
    end
end
