export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:*' enable cvs svn

plugins=(git common-aliases)

source $ZSH/oh-my-zsh.sh

# legacy customization stuff
if [ -f ~/.zshrc-p ]; then
  source ~/.zshrc-p
fi
