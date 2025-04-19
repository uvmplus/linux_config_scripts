#!/bin/bash 
set -euo pipefail

# Check if Zsh is already installed
if command -v zsh &> /dev/null; then
    echo "Zsh is already installed."
else
    echo "Zsh not found. Installing..."
    exit 1
fi

# Install Oh My Zsh (optional but recommended)
# 在vscode集成终端中，与github 的链接有问题，所以最好在gnome shell运行脚本
echo "Now install oh my zsh"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Oh My Zsh installation complete!"

