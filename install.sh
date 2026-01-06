#!/usr/bin/env bash


# Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# neovim
brew install neovim

# gh
brew install gh

# gh extensions
brew install gh
gh extension install dlvhdr/gh-dash
gh extension install meiji163/gh-notify

# opencode
curl -fsSL https://opencode.ai/install | bash

# Mise
curl https://mise.run | sh
