#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
bash-completion2
git-completion
git
git-extras
nano
python
ruby-build
rbenv
bash-git-prompt
docker
)

brew install "${apps[@]}"

LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.bash_profile || echo "$LINE" >> ~/.bash_profile

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"


brew cleanup
