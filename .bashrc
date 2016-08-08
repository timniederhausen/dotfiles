# Tims personal config. Shamelessly stolen from gentoo

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
        # Shell is non-interactive.  Be done now!
        return
fi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Change the window title of X terminals
case ${TERM} in
        xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/#$HOME/~}\007"'
                ;;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME}:${PWD/#$HOME/~}\033\\"'
                ;;
esac

if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
        PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# locale settings
export LC_CTYPE=en_US.UTF-8

# ls colors
export LSCOLORS=ExGxCxDxCxEgEdAbAgAcAd
export CLICOLOR=1

export EDITOR='joe --autoindent --wordwrap -nobackups'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Generic commands
alias joe='joe --autoindent --wordwrap -nobackups'
# FreeBSD ls
#alias ls='ls -laFoh'
# GNU ls
#alias ls='ls -laFh --color'

# OpenSSL
alias viewcrt='openssl x509 -text -noout -in'

# sysop tasks
if [[ ${EUID} == 0 ]] ; then
	alias portupdates='pkg_version -vIL='
	alias portupdate-silent='portmaster -a -G --no-confirm -d'
fi

# keychain for key management
keychain
. ~/.keychain/$HOSTNAME-sh
#. ~/.keychain/$HOSTNAME-sh-gpg
