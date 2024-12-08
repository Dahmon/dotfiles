#!/bin/bash

if ! command -v brew &>/dev/null; then
	echo 'brew is not installed. Installing.'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zprofile
fi

brew install chezmoi
chezmoi init dahmon
chezmoi apply
