#!/bin/bash

##brew prune
##brew doctor
##xcode-select --install

brew install python
brew link --overwrite python

##brew tap homebrew/versions
##brew install subversion16
#brew untap homebrew/versions

##brew tap phinze/homebrew-cask
##brew install brew-cask
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
##brew install cowsay
brew install ranger
##brew install homebrew/games/nethack
brew install tmux
brew install docker
brew install boot2docker
brew install dos2unix

##brew tap homebrew/dupes
##brew tap josegonzalez/homebrew-php
##brew install php55  --with-debug --with-fpm --with-gmp --with-imap --with-intl --with-libmysql --with-phpdbg --with-thread-safety --with-tidy
##
##brew tap homebrew/nginx
##brew install nginx-full

brew install htop
brew install phploc
brew install phpcpd
brew install phpmd
brew install git
brew install fbida
##brew install freeimage

##npm install -g picture-tube
##brew install Pidgin
##brew install mtr
##brew install node
brew install netcat6
brew install httpie

curl -L https://github.com/git/git/raw/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc

curl -L git.io/cow  | bash

brew install icdiff
brew install moreutils
brew cask install java
curl -L git.io/cow | bash
npm install urlencode
