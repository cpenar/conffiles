# rewrite git_prompt_info from .oh_my_zsh/lib/git.zsh
# just to make parse_git_dirty come first
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

local ret_status="%(?:%{$FG[006]%}:%{$FG[203]%})"
PROMPT='%{$reset_color%}%{$FG[227]%}@%m$(git_prompt_info) $FG[158]%}${ret_status}%c %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[010]%}"
