# dotfiles

## oh-my-zsh subtree

### Setup

```
git remote add -f ohmyzsh https://github.com/ohmyzsh/ohmyzsh.git
git merge -s ours --no-commit --allow-unrelated-histories ohmyzsh/master
git read-tree --prefix=.oh-my-zsh/ -u ohmyzsh/master
```

### Updating

```
git subtree pull -P .oh-my-zsh ohmyzsh master
```
