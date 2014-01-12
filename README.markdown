# dotfiles

## Installation:

```
git clone git://github.com/falmp/dotfiles.git ~/.dotfiles
~/.dotfiles/.bin/bootstrap
```

## Update:

```
git pull
git submodule update --init
```

## Installation of vim plugins:

```
cd ~/.dotfiles
git submodule add https://github.com/tpope/vim-pathogen.git .vim/bundle/pathogen
git add .
git commit -m "Install pathogen"
git push
```

## Uninstallation of a vim plugin:

```
cd ~/.dotfiles
git submodule deinit -f .vim/bundle/nerdtree
git rm .vim/bundle/nerdtree # use --cached to keep files
git add .
git commit -m "Uninstall nerdtree"
git push
```
