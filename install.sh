#!/usr/bin/env bash

set -euo pipefail

echo "==> Setting up development environment"

# ------------------------------------------------------------
# Detect Linux package manager and install bootstrap dependencies
# ------------------------------------------------------------

if command -v apt-get >/dev/null 2>&1; then
    echo "==> Detected Debian/Ubuntu"

    sudo apt-get update
    sudo apt-get install -y \
        build-essential \
        procps \
        curl \
        file \
        git

elif command -v dnf >/dev/null 2>&1; then
    echo "==> Detected Fedora/RHEL"

    sudo dnf group install -y development-tools
    sudo dnf install -y \
        procps-ng \
        curl \
        file \
        git

elif command -v pacman >/dev/null 2>&1; then
    echo "==> Detected Arch Linux"

    sudo pacman -Sy --needed --noconfirm \
        base-devel \
        procps-ng \
        curl \
        file \
        git

else
    echo "Unsupported Linux distribution."
    exit 1
fi

# ------------------------------------------------------------
# Install Homebrew
# ------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
    echo "==> Installing Homebrew"

    /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Homebrew's normal Linux location
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ------------------------------------------------------------
# Install/update development tools
# ------------------------------------------------------------

echo "==> Updating Homebrew"
brew update

echo "==> Installing packages from $HOME/dotfiles/brewfile"
brew bundle --file="$HOME/dotfiles/brewfile"

echo "==> Setup complete"
echo "Installed versions:"
git --version
curl --version | head -n 1
vim --version | head -n 1
nvim --version | head -n 1
fzf --version
unzip -v | head -n 1
python3 --version
eza --version
gh --version | head -n 1

# ------------------------------------------------------------
# Setting up github authenticataion
# ------------------------------------------------------------
echo "==> Setting up Github Authentication using a browser"
if ! gh auth status --hostname github.com >/dev/null 2>&1; then
    gh auth login --hostname github.com --git-protocol https --web
fi

gh auth setup-git --hostname github.com

# ------------------------------------------------------------
# Setting up AI
# ------------------------------------------------------------
curl -fsSL https://chatgpt.com/codex/install.sh | sh
