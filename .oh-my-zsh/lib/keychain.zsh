hash keychain 2> /dev/null && {
  keychain

  if [ -f ~/.keychain/$HOST-sh ]; then
    . ~/.keychain/$HOST-sh
  fi

  if [ -f ~/.keychain/$HOST-sh-gpg ]; then
    . ~/.keychain/$HOST-sh-gpg
  fi
}
