#!/usr/bin/env bash

echo "🚀 Starting macOS setup..."

# 1. Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. Install packages from Brewfile in this repo
if [ -f ./Brewfile ]; then
    echo "Installing brew packages..."
    brew bundle --file=./Brewfile
fi

# 3. Copy dotfiles (exclude .git)
echo "Copying dotfiles..."
rsync -av --exclude='.git/' --exclude='macos-setup.sh' ./ ~/

# 4. macOS defaults
# echo "Applying macOS settings..."
# defaults write com.apple.finder AppleShowAllFiles -bool true
# defaults write com.apple.dock autohide -bool true
# killall Finder
# killall Dock

echo "✅ Setup complete. You may need to log out or restart for some settings to apply."
