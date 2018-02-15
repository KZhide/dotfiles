#!/bin/bash

is_exists() {
  which "$1" >/dev/null 2>&1
  return $?
}

echo "Install packages ..."
case "$OSTYPE" in
  *'darwin'*)
    if ! is_exists "brew" ; then
      echo "Install brew ..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install -y zsh zplug python3 neovim
    echo "Done."
    ;;
  *'linux'*) 
    if is_exists "apt"; then
      sudo apt install -y software-properties-common \
        git build-essential \
        zsh zplug \
        python3-dev python3-pip \
        neovim
      echo "Done."
    else
      echo "No package manager are available."
    fi
    ;;
esac
