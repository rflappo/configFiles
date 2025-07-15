function _afowler_first_line() {
  # Reconstruct the first part of the prompt based on the original PROMPT definition
  # From [9]: PROMPT='%m %B%F{blue}:: %b%F{green}%3~ $(hg_prompt_info)$(git_prompt_info)%B%(!.%F{red}.%F{blue})»%f%b '
  # Extracting the components for the first line: hostname, separator, path, and git/hg info
  local first_line_content
  first_line_content="%m %B%F{blue}:: %b%F{blue}%3~ "
  print -rP "$first_line_content"
}
# Add our custom function to the precmd_functions array
# This ensures it runs before the PROMPT is displayed.
# Appending it with `+=(...)` prevents overwriting other precmd functions if they were to exist.
precmd_functions+=( _afowler_first_line )

# Modified PROMPT:
PROMPT='$(hg_prompt_info)$(git_prompt_info)%B%(!.%F{red}.%F{blue})»%f%b '

RPS1='%(?..%F{red}%? ↵%f)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[magenta]%}hg:‹%{$fg[yellow]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[magenta]%}› %{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_HG_PROMPT_CLEAN=""
