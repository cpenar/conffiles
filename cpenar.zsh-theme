local ret_status=" %(?:%{$fg[green]%}▶ :%{$fg[red]%}▶ )"
PROMPT='%{$FG[227]%}@%m:%{$FG[106]%}%c%{$reset_color%}$(git_prompt_info)${ret_status}%{$reset_color%}'
  
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[000]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}λ"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}λ"
