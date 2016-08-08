# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# file rename magick
bindkey "^[m" copy-prev-shell-word

# jobs
setopt long_list_jobs

# Get rid of annoying second-chance questions..
setopt rmstarsilent

ZLE_REMOVE_SUFFIX_CHARS=""

# Locale settings
export LANG=en_US.UTF-8

# pager
export PAGER="less"
export LESS="-R"

export EDITOR="joe --autoindent --wordwrap -nobackups"
