local ret_status="%(?:%{$fg[green]%}▶ :%{$fg[red]%}▶ )"
PROMPT='%{$reset_color%}%{$FG[227]%}@%m$(git_prompt_info) %{$fg[blue]%}%c${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[000]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[197]%}λ"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[010]%}λ"
