eval red='$FG[203]'
eval green='$FG[184]'
eval yellow='$FG[220]'
eval blue='$FG[081]'
eval magenta='$FG[204]'
eval cyan='$FG[037]'
eval white='$FG[231]'
eval grey='$FG[145]'

PROMPT='%{$white%}in%{$reset_color%} ${_current_dir}$(git_prompt_info)%{$white%}$%{$reset_color%} '
# PROMPT='%{$white%}%m %{$reset_color%}${_current_dir}$(git_prompt_info)%{$white%}$%{$reset_color%} '

PROMPT2='%{$white%}◀%{$reset_color%} '

RPROMPT='%{$white%}%T%{$reset_color%}'

local _current_dir="%{$yellow%}%1~%{$reset_color%} "
local _return_status="%{$red%}%(?..×)%{$reset_color%}"
local _hist_no="%{$grey%}%h%{$reset_color%}"

if [[ $USER == "root" ]]; then
  CARETCOLOR="$red"
else
  CARETCOLOR="$white"
fi

MODE_INDICATOR="%{_bold$yellow%}❮%{$reset_color%}%{$yellow%}❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$grey%}) %{$reset_color%}"

function git_dirty() {
  echo "%{$red%} +$(git status --short | gwc -l)%{$reset_color%}"
  # echo "%{$red%} +$(git status --short | wc -l)%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_CLEAN="%{$green%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$green%}✚{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$yellow%}⚑{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DELETED=" %{$red%}✖{$reset_color%} "
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$blue%}▴{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$cyan%}§{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$grey%}◒{$reset_color%} "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$green%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$yellow%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$red%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$yellow%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$reset_color%}[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'
