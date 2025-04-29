#!/bin/bash

set -e

is_arm64_linux=$([ "$(uname)" = "Linux" ] && { [ "$(uname -m)" = "arm64" ] || [ "$(uname -m)" = "aarch64" ]; } && echo true || echo false)

if [ "$(uname)" == "Darwin" ]; then
  # If any fail, enable Settings > Privacy > Full Disk Access for Terminal
  # Sources:
  #  - http://mths.be/macos
  #  - https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

  # Close all System Preferences windows
  osascript -e 'tell application "System Preferences" to quit'

  # AeroSpace
  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
  defaults write com.apple.dock expose-group-apps -bool true && killall Dock
  # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
  defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

  # Language
  defaults write NSGlobalDomain AppleLanguages -array "en"
  defaults write NSGlobalDomain AppleLocale -string "en_AU@currency=AUD"

  # Always show scrollbars
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

  # Dock
  # Remove the auto-hiding Dock delay
  defaults write com.apple.dock autohide-delay -float 0
  # Remove the animation when hiding/showing the Dock
  defaults write com.apple.dock autohide-time-modifier -float 0
  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true
  # Make Dock icons of hidden applications translucent
  defaults write com.apple.dock showhidden -bool true

  # Measurement
  defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
  defaults write NSGlobalDomain AppleMetricUnits -bool true

  # Disable Tap to Click
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
  sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
  sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 0
  sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0

  # Require Password Immediately
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # Screenshots
  defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
  defaults write com.apple.screencapture type -string "png"
  defaults write com.apple.screencapture disable-shadow -bool true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # Files
  chflags nohidden ~/Library
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Safari/WebKit
  # Privacy
  defaults write com.apple.Safari UniversalSearchEnabled -bool false
  defaults write com.apple.Safari SuppressSearchSuggestions -bool true
  defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

  # Set Safari’s home page to `about:blank`
  defaults write com.apple.Safari HomePage -string "about:blank"

  # Enable the Develop menu and the Web Inspector in Safari
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
fi

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

  if [ $is_arm64_linux = true ]; then
    sudo snap install chezmoi --classic
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
