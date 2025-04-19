#!/bin/bash
set -euo pipefail

# 安装 VS Code
if ! dpkg -l | grep -q "^ii  code "  # 检查 VS Code 是否已安装
then
    echo "正在安装 Visual Studio Code..."
    # 下载 VS Code 签名密钥
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    # 更新软件包列表并安装 VS Code
    sudo apt install -y apt-transport-https
    sudo apt update
    sudo apt install -y code
else
    echo "Visual Studio Code 已安装，跳过..."
fi