# dotfiles

## Setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap homebrew/cask-versions
brew cask install iterm2 rectangle caffeine dozer spotify visual-studio-code openjdk google-chrome odrive aerial bitwarden copyq # intellij-idea slack docker skype postman insomnia postgres telegram vlc dockstation
brew install coreutils tree the_silver_searcher colordiff pygments direnv git bash-completion jq watch vim telnet wget httpie translate-shell # maven gnupg git-crypt awscli nvm kafkacat
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

### Different Java versions

```
brew install jenv
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8 adoptopenjdk11
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home/
```

### Use Touch ID to authorize sudo on iTerm2

1. Turn off `Preferences > Advanced > Allow sessions to survive logging out and back in.`
2. Add this to the top of the /etc/pam.d/sudo file:
    ```
    auth       sufficient     pam_tid.so
    ```
3. Restart iTerm.

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

## TODO

* For the next installation from scratch, get default state, apply preferred settings and get final state; try to automate these changes. See [this link](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/).