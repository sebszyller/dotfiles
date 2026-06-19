set -gx FZF_DEFAULT_OPTS "
    --color=fg:#b4bdc3,bg:-1,hl:#d4a85c
    --color=fg+:#d4a85c,bg+:#1c1917,hl+:#d4a85c
    --color=info:#6e6763,prompt:#b4bdc3,pointer:#d4a85c
    --color=marker:#6099c0,spinner:#b279a7,header:#6099c0
    --color=separator:#6e6763,border:#6e6763
    --gutter=' '
    --height 40%  --no-scrollbar
    --prompt='> ' --pointer='❚' --layout=reverse
    --border=rounded"

set -gx FZF_CTRL_R_OPTS "--bind 'ctrl-y:execute-silent(echo -n {1..} | yy)+abort'"
set -gx FZF_CTRL_T_OPTS "--bind 'ctrl-y:execute-silent(echo -n {} | yy)+abort'"
