#!/bin/bash

set -ex

if ! command -v brew &>/dev/null; then
  echo 'brew is not installed. Installing.'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Update to templated file
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.bashrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>$HOME/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew install chezmoi
chezmoi init dahmon
chezmoi apply
