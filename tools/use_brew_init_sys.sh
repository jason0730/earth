#!/bin/bash

brew prune
brew doctor
xcode-select --install

brew install python
brew link --overwrite python

brew tap homebrew/versions
brew install subversion16
#brew untap homebrew/versions

brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install sublime-text

brew install coreutils

brew install tcpflow
brew install xclip
brew install watch
brew install terminal-notifier
brew install pstree
brew install wget
brew install htop
brew install ack
brew install cloc
brew install cowsay
brew install ranger
brew install homebrew/games/nethack
brew install tmux
brew install docker
brew install boot2docker
brew install dos2unix
