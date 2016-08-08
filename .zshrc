ZSH=$HOME/.zsh

# Load and run compinit
autoload -U compinit
compinit -i


for config_file ($ZSH/*.zsh); do
  source $config_file
done

if [ -f ~/.zshrc-p ]; then
	source ~/.zshrc-p
fi
