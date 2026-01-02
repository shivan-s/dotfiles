#!/usr/bin/env bash

echo 'TODO'

# Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# neovim
brew install neovim

# gh extensions
brew install gh
gh extension install dlvhdr/gh-dash
gh extension install meiji163/gh-notify

# opencode
curl -fsSL https://opencode.ai/install | bash
