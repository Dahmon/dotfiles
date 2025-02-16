#!/bin/bash

set -e

is_arm64_linux=$([ "$(uname)" = "Linux" ] && { [ "$(uname -m)" = "arm64" ] || [ "$(uname -m)" = "aarch64" ]; } && echo true || echo false)

if ! command -v brew &>/dev/null; then
  if [ $is_arm64_linux = true ]; then
    echo 'unable to install brew on ARM Linux'
  else
    echo 'installing brew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if command -v /usr/local/bin/brew &>/dev/null; then
      echo 'setting path for macos brew'
      echo 'eval "$(/usr/local/bin/brew shellenv)"' >>~/.zshrc
      eval "$(/usr/local/bin/brew shellenv)"
    fi

    if command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null; then
      echo 'setting path for linux brew'
      echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>~/.zshrc
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
  fi
else
  echo 'brew is already installed'
fi

if ! command -v chezmoi &>/dev/null; then
  echo 'installing chezmoi'

  if is_arm64_linux; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
  else
    brew install chezmoi
  fi
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
