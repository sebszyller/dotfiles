local fmt='--pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'

alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gpush="git push"
alias pchaj="git push"
alias gclone="git clone"
alias gpull="git pull"
alias gcm="git commit -m"
alias gl="clear; git log --oneline $fmt"
alias glg="clear; git log --graph $fmt"
alias glp="clear; git log -p $fmt"
alias gls="clear; git log --stat $fmt"
alias gsh="clear; git show $fmt"
alias gr="git reset"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gst="git stash"
alias gsta="git stash apply"
alias gru="git remote update"
alias grebase="git rebase"
alias gfetch="git fetch"
alias gmerge="gmerge"
alias gdiff="git diff"
alias gdiffc="git diff --cached"
alias gcl="git clean"

gshf() {
    clear
    local sha=$(eval "git log --oneline $fmt --color=always" | fzf --ansi --no-sort | awk '{print $1}')
    gsh --color=always --decorate $sha
}
