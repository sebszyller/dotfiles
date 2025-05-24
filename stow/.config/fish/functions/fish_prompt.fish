function fish_prompt
    if count $CONDA_PROMPT_MODIFIER > /dev/null
        set_color normal
        printf $CONDA_PROMPT_MODIFIER
    end

    set_color white
    printf "in "

    set_color green
    printf "%s" (prompt_pwd)
    set_color normal

    set_color normal
    set -l is_git (git symbolic-ref --short HEAD 2>/dev/null)
    if not test -z "$is_git"
        set -l branch (git symbolic-ref --short HEAD 2> /dev/null; or git show-ref --head -s --abbrev | head -n1 2> /dev/null)
        set -l dirty_count (git status --short | wcorgwc -l)
        if test $dirty_count -eq 0
            printf " (%s)" $branch
        else
            printf " (%s %s+%s%s)" $branch (set_color brred) $dirty_count (set_color normal)
        end
    end

    set_color white
    printf " λ "
    set_color normal
end
