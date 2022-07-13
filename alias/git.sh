local fmt='--pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'

alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gcl="git clean"
alias gclone="git clone"
alias gcm="git commit -m"
alias gdf="git diff"
alias gdfc="git diff --cached"
alias gfetch="git fetch"
alias gl="clear; git log --oneline $fmt"
alias glg="clear; git log --graph $fmt"
alias glp="clear; git log -p $fmt"
alias gls="clear; git log --stat $fmt"
alias gmerge="gmerge"
alias gpull="git pull"
alias gpush="git push"
alias pchaj="git push"
alias gr="git reset"
alias grebase="git rebase"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gru="git remote update"
alias gs="git status"
alias gsh="clear; git show $fmt"
alias gst="git stash"
alias gsta="git stash apply"

gshf() {
    clear
    local sha=$(eval "git log --oneline $fmt --color=always" | fzf --ansi --no-sort | awk '{print $1}')
    gsh --color=always --decorate $sha
}
