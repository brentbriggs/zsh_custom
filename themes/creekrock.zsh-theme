PROMPT='%{$fg_bold[red]%}%# %{$reset_color%}%n@%m: %50<..<%~ ➜ '
PS2='%{$fg_bold[red]%}%_%{$reset_color%} ➜ '

# Set the right side prompt to include extra information.
#RPS1='%{$fg_bold[red]%}%# %n@%m%{$reset_color%}' 
#set transient_prompt

# Set the prompt for PS4, the xtrace prompt
PS4=' %{$fg_bold[red]%}+%N:%i:%%{$reset_color%} ➜ '


ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
