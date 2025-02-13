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
  echo 'brew is already installed.'
fi

if ! command -v chezmoi &>/dev/null; then
  echo 'installing and initalising chezmoi'
  brew install chezmoi
  chezmoi init dahmon
  chezmoi apply
else
  echo 'chezmoi is already installed'
fi
