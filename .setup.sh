#!/bin/bash

set -e

if ! command -v brew &>/dev/null; then
  echo 'installing brew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if command -v /usr/local/bin/brew &>/dev/null; then
    echo 'setting path for macos brew'
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >>$HOME/.zshrc
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  if command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null; then
    echo 'setting path for linux brew'
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
else
  echo 'brew is already installed'
fi

if ! command -v chezmoi &>/dev/null; then
  echo 'installing chezmoi'
  brew install chezmoi
else
  echo 'chezmoi is already installed'
fi

if ! test -d $(chezmoi source-path); then
  echo 'initialising chezmoi'
  chezmoi init dahmon --ssh
else
  echo 'chezmoi is already initialised'
fi

echo 'applying chezmoi'
chezmoi apply
