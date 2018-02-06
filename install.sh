#!/usr/bin/env bash

export FRESH_LOCAL_SOURCE=mikelorant/dotfiles

# /usr/bin/xcode-select -p || /usr/bin/xcode-select --install
# 
# echo "After Xcode Command Line Developer Tools has installed press enter."
# read

[ -f $HOME/.ssh/id_rsa ] || ssh-keygen -f $HOME/.ssh/id_rsa -C $(id -un)

[ -f $HOME/.freshrc ] || /usr/bin/env bash <(curl -sL https://get.freshshell.com)
ln -sf .dotfiles/fresh/freshrc $HOME/.freshrc

which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cd $HOME/.dotfiles

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" | exit; done 2>/dev/null &

softwareupdate -i -a

brew update
brew upgrade
brew tap homebrew/bundle
brew bundle --verbose

which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

cd $HOME
bin/fresh

which atom && apm stars --install

gem install -g Gemfile
