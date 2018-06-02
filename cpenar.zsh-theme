local ret_status="%(?:%{$FG[154]%}:%{$FG[203]%})"
PROMPT='%{$reset_color%}%{$FG[227]%}@%m$(git_prompt_info) $FG[158]%}${ret_status}%c %{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[247]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[196]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[010]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_DIRTY "
