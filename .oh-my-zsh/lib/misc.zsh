autoload -Uz is-at-least

# *-magic is known buggy in some versions; disable if so
if [[ $DISABLE_MAGIC_FUNCTIONS != true ]]; then
  for d in $fpath; do
    if [[ -e "$d/url-quote-magic" ]]; then
      if is-at-least 5.1; then
        autoload -Uz bracketed-paste-magic
        zle -N bracketed-paste bracketed-paste-magic
      fi
      autoload -Uz url-quote-magic
      zle -N self-insert url-quote-magic
    break
    fi
  done
fi

# Get rid of annoying second-chance questions..
setopt rmstarsilent

## jobs
setopt long_list_jobs

env_default 'PAGER' 'less'
env_default 'LESS' '-R'
env_default 'EDITOR' 'joe --autoindent --wordwrap -nobackups'

# Locale settings
export LANG=en_US.UTF-8

## super user alias
alias _='sudo '

## more intelligent acking for ubuntu users
if (( $+commands[ack-grep] )); then
  alias afind='ack-grep -il'
else
  alias afind='ack -il'
fi

# recognize comments
setopt interactivecomments

# common commands
alias joe='joe --autoindent --wordwrap -nobackups'
alias viewcrt='openssl x509 -text -noout -in'

# Display a SSH key's fingerprint
function fingerprint() {
    ssh-keygen -lf $1 | awk '{print $2,$NF}'
}
