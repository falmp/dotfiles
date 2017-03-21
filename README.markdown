# dotfiles

## Font

Download and install **[Monaco for Powerline](https://gist.github.com/baopham/1838072#file-monaco-for-powerline-otf)** font.

## Setup

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install coreutils tree the_silver_searcher colordiff httpie direnv git bash-completion jq
```

## Installation:

```
git clone git://github.com/falmp/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --init
.bin/bootstrap
```

## Update:

```
cd ~/.dotfiles
git pull
git submodule foreach git pull origin master
```

## Installation of vim plugins:

```
cd ~/.dotfiles
git submodule add https://github.com/tpope/vim-pathogen.git .vim/bundle/pathogen
git add .
git commit -m "Install pathogen"
git push
```

## Uninstallation of vim plugins:

```
cd ~/.dotfiles
git submodule deinit -f .vim/bundle/nerdtree
git rm -f .vim/bundle/nerdtree # use --cached instead to keep files
git add .
git commit -m "Uninstall nerdtree"
git push
```
