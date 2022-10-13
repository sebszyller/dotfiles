export DOTFILES=~/dotfiles
export ZSH=$DOTFILES/oh-my-zsh
export CONDA=~/miniconda3

export FZF_DEFAULT_OPTS="--height 40% --no-info --layout=reverse"

ZSH_THEME="materialshelloceanic"

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/ls-after-cd/ls-after-cd.zsh

eval `ssh-agent`

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(''"$CONDA"'/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA/etc/profile.d/conda.sh" ]; then
        . "$CONDA/etc/profile.d/conda.sh"
    else
        export PATH="/Users/seb/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source $DOTFILES/alias/git.sh
source $DOTFILES/alias/misc.sh

setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS

