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

setopt rmstarsilent         # Get rid of annoying second-chance questions..
setopt multios              # enable redirect to multiple streams: echo >file1 >file2
setopt long_list_jobs       # show long list format job notifications
setopt interactivecomments  # recognize comments

env_default 'PAGER' 'less'
env_default 'LESS' '-R'
env_default 'EDITOR' 'joe --autoindent --wordwrap -nobackups'

# Locale settings
export LANG=en_US.UTF-8

## super user alias
alias _='sudo '

## more intelligent acking for ubuntu users and no alias for users without ack
if (( $+commands[ack-grep] )); then
  alias afind='ack-grep -il'
elif (( $+commands[ack] )); then
  alias afind='ack -il'
fi

# common commands
alias joe='joe --autoindent --wordwrap -nobackups'
alias viewcrt='openssl x509 -text -noout -in'

# Display a SSH key's fingerprint
function fingerprint() {
    ssh-keygen -lf $1 | awk '{print $2,$NF}'
}
