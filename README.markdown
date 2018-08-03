# dotfiles

## Setup

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/versions
brew install coreutils tree the_silver_searcher colordiff direnv git bash-completion jq watch vim telnet wget # httpie maven
brew cask install iterm2 spectacle caffeine spotify visual-studio-code java8 google-chrome # intellij-idea odrive mysqlworkbench slack docker skype postman
```

## Mac App Store

- [LastPass](https://itunes.apple.com/us/app/lastpass/id926036361?ls=1&mt=12)

## Avatar

```
wget https://avatars.githubusercontent.com/falmp -O ~/falmp.jpg
```

## Font

Download and install **[Monaco for Powerline](https://gist.github.com/baopham/1838072#file-monaco-for-powerline-otf)** font:

```
wget https://gist.githubusercontent.com/baopham/1838072/raw/Monaco%2520for%2520Powerline.otf -P ~/Library/Fonts
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
