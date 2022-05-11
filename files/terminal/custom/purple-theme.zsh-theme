# purple username
username() {
   echo "%{$FG[012]%}%n%{$reset_color%}"
}

# current directory, two levels deep
directory() {
   echo "%2~"
}

# current time with milliseconds
current_time() {
   echo "%*"
}

# returns 👾 if there are errors, nothing otherwise
return_status() {
   echo "%(?..👾)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_DIRTY="[*]"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  #[ -n "$git_where" ] && echo "$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  [ -n "$git_where" ] && echo "$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[magenta]%}${git_where#(refs/heads/|tags/)}%{$reset_color%}$GIT_PROMPT_SUFFIX"
}


# putting it all together
PROMPT='%B$(username) $(directory)%b '
RPROMPT='$(git_prompt_info)'
#RPROMPT='$(current_time)$(return_status)'

