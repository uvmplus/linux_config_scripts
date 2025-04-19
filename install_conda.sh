#!/bin/bash
set -euo pipefail

# 设置要下载的Anaconda版本及下载链接
ANACONDA_VERSION="2023.03"
ANACONDA_DEB="Anaconda3-${ANACONDA_VERSION}-Linux-x86_64.sh"
ANACONDA_URL="https://repo.anaconda.com/archive/${ANACONDA_DEB}"

# 下载 Anaconda 安装包
echo "Downloading Anaconda..."
wget ${ANACONDA_URL} -O ${ANACONDA_DEB}



# 运行 Anaconda 安装脚本
echo "Installing Anaconda..."
bash ${ANACONDA_DEB} -b -p $HOME/anaconda3

# 配置环境变量
# 定义要追加的内容
conda_init_block='
export PATH="$HOME/anaconda3/bin:$PATH
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('"/home/belle/anaconda3/bin/conda"' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/belle/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/belle/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/belle/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
'

# 将内容追加到 ~/.zshrc
echo "$conda_init_block" >> ~/.zshrc

echo "Conda initialization block has been appended to ~/.zshrc"
source ~/.zshrc

# 更新 conda
echo "Updating conda..."
conda update -y conda


echo "Anaconda installation is complete."

# 检查安装
echo "Checking Anaconda installation..."
conda --version

# 提示安装完成
echo "Anaconda has been installed successfully."
