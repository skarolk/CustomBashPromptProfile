# for .zlogin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function prompt {
    ## Define the prompt character
    local CHAR="☠" ## ♥ ☆ ♬ ○ ♩ ● ♪ - Keeping some cool ASCII Characters for reference
    autoload -U colors && colors
    ## Here is where we actually export the PS1 Variable which stores the text for your prompt
    PS1="%{$fg[green]%}%(4~|%-1~/.../%2~|%~) %{$fg[white]%}%{$CHAR%} %{$fg[green]%}%{>%} %{$reset_color%}% "
    PS2='> '
    PS4='+ '
}

prompt

# older .bash_profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

LANG=C
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
function prompt {
  local CHAR="☠"
  # Define some local colors
  local RED="\[\e[0;31m\]"
  local GREEN="\[\e[01;32m\]"
  local BLUE="\[\e[01;34m\]"
  local CYAN="\[\033[0;36m\]"
  local WHITE="\[\033[0;37m\]"
  local ON_CYAN="\[\033[46m\]"
  local GRAY_TEXT_BLUE_BACKGROUND="\[\e[37;44;1m\]"
  local YELLOW="\[\033[0;33m\]"
  # Define a variable to reset the text color
  local RESET="\[\e[0m\]"
  # Here is where we actually export the PS1 Variable which stores the text for your prompt
  export PS1="\[\e]2;\u@\h\a$BLUE\t$RESET$RED\$(parse_git_branch) $GREEN\W\n$WHITE $CHAR $RESET "
}
# Finally call the function and our prompt is all pretty
prompt
