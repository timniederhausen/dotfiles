# ls colors
autoload colors; colors;
export LSCOLORS=ExGxCxDxCxEgEdAbAgAcAd
export CLICOLOR=1

# Enable ls colors
# Find the option for using colors in ls, depending on the version: Linux or BSD
if [[ "$(uname -s)" == "FreeBSD" ]] || [[ "$(uname -s)" == "Darwin" ]]; then
  alias ls='ls -o'
else
  alias ls='ls --color'
fi

setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevarS

if [[ x$WINDOW != x ]]
then
  SCREEN_NO="%B$WINDOW%b "
else
  SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

function prompt_char {
  if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) %_$(prompt_char)%{$reset_color%} '

# Setup the prompt with pretty colors
setopt prompt_subst
