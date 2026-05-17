set --global __gitfmt '--pretty=format:"%C(red)%h%Creset %s %C(green)(%cr) %C(dim white)%an%Creset%C(#D4A85C)%d%C(reset)"'

alias ga "git add"
alias gap "git add -p"
alias gb "git branch"
alias gc "git checkout"
alias gcm "git commit"
alias gcma "git commit --amend"
alias gcmax "git commit --amend --no-edit"
alias gdf "git diff"
alias gdfc "git diff --cached"
alias glp "clear; git log -p --show-signature $__gitfmt"
alias gla "gl --all"
alias gpull "git pull"
alias gpush "git push"
alias gpushf "git push --force-with-lease"
alias gr "git reset"
alias grh "git reset --hard"
alias grs "git reset --soft"
alias gru "git remote update"
alias grb "git rebase"
alias grbi "git rebase --interactive"
alias gs "git status"
alias gst "git stash"
alias gsta "git stash apply"

alias lg "lazygit"
alias wt "git worktree"

function gl
    clear
    set --local sha (eval "git log --graph --oneline $__gitfmt --color=always" $argv[1] | fzf \
        --header "<CR>: select | <C-c>: abort | <C-y>: yank sha" \
        --bind="ctrl-y:execute-silent(echo {} | rg -o '[a-f0-9]{7,}' | head -n 1 | tr -d '\n' | yy)+transform-header(echo {} | rg -o '[a-f0-9]{7,}' | head -n 1 | xargs -I % echo '<CR>: select | <C-c>: abort | <C-y>: yank sha (last yank: %)')" \
        --ansi --no-sort --height=80% \
        --preview="set -l commit (echo {} | rg -o '[a-f0-9]{7,}' | head -n 1); if test -n \"\$commit\"; git show --show-signature --color=always $__gitfmt --stat \$commit; else; echo 'Select a commit node to preview...'; end" \
        | rg -o '[a-f0-9]{7,}' | head -n 1)

    if test -z "$sha"
        kill -INT $fish_pid
    else
        git show --show-signature $__gitfmt --color=always --decorate $sha
    end
end

complete --command gl --wraps 'git log'

function wtl
    # List and kill with <C-x>
    set --local tree_branch (git worktree list | __fzfselectorexit --header "<CR>: select | <C-x>: remove | <C-c>: abort" --bind "ctrl-x:execute-silent(echo {} | awk '{print \$1}' | xargs git worktree remove)+clear-query+reload(git worktree list)")
    set --local just_path (echo $tree_branch | awk '{print $1}')

    if test (pwd) = $just_path
        printf "%sAlready in target directory%s\n" (set_color --bold brred) (set_color normal)
    else
        cd $just_path
    end
end

function ccm
    printf "%s%-10s%s %s\n" (set_color --bold white)   "build:"    (set_color normal) "Changes that affect the build system or external dependencies"
    printf "%s%-10s%s %s\n" (set_color --bold green)   "ci:"       (set_color normal) "Changes to the CI configuration files and scripts"
    printf "%s%-10s%s %s\n" (set_color --bold blue)    "docs:"     (set_color normal) "Documentation only changes, READMEs"
    printf "%s%-10s%s %s\n" (set_color --bold red)     "chore:"    (set_color normal) "All other random stuff that isn't build, ci, docs or code, e.g. tooling, meta"
    printf "%s%-10s%s %s\n" (set_color --bold green)   "feat:"     (set_color normal) "Code: a new feature"
    printf "%s%-10s%s %s\n" (set_color --bold magenta) "fix:"      (set_color normal) "Code: a bug fix"
    printf "%s%-10s%s %s\n" (set_color --bold white)   "perf:"     (set_color normal) "Code: a change that improves performance"
    printf "%s%-10s%s %s\n" (set_color --bold green)   "refactor:" (set_color normal) "Code: a change that neither fixes a bug nor adds a feature; restructuring, renaming"
    printf "%s%-10s%s %s\n" (set_color --bold blue)    "style:"    (set_color normal) "Code: a change that does not affect the meaning of the code (formatters)"
    printf "%s%-10s%s %s\n" (set_color --bold red)     "test:"     (set_color normal) "Code: adding missing tests or correcting existing tests"
end
