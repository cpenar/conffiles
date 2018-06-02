local ret_status="%(?:%{$fg[green]%}▶ :%{$fg[red]%}▶ )"
PROMPT='%{$reset_color%}%{$FG[227]%}@%m$(git_prompt_info) %{$FG[158]%}%c${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[247]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[197]%}λ"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[010]%}λ"
