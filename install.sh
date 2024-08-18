#!/usr/bin/env bash

export FRESH_LOCAL_SOURCE=mikelorant/dotfiles

/usr/bin/xcode-select --print-path || /usr/bin/xcode-select --install

echo "After Xcode Command Line Developer Tools has installed press enter."
read

[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -f  ~/.ssh/id_ed25519 -N "" -C $(id -un)

[ -f ~/.freshrc ] || /usr/bin/env bash <(curl -sL https://get.freshshell.com)
ln -sf .dotfiles/fresh/freshrc $HOME/.freshrc

which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

cd $HOME/.dotfiles

sudo --validate
while true; do sudo --non-interactive true; sleep 60; kill -0 "$$" | exit; done 2>/dev/null &

softwareupdate --install --all --verbose

brew update
brew upgrade
brew tap homebrew/bundle
brew bundle --verbose

cd $HOME
bin/fresh
cd -

which ppm && ppm stars --install

# which gem && gem install -g Gemfile
