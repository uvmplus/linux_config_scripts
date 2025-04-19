#!/bin/bash

# GNU Toolchain Automated Installation Script for Linux

set -euo pipefail  # 出现错误时立即停止脚本

# 检查是否具有 root 权限
if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root (sudo)." >&2
    exit 1
fi

# 更新软件包列表
apt-get update

# 安装 build-essential 软件包（包含 GCC 和其他构建工具）
apt-get install -y build-essential

# 安装其他常用 GNU 工具链组件
apt-get install -y \
    autoconf \
    automake \
    binutils \
    bison \
    flex \
    gdb \
    libtool \
    make \
    pkg-config

# 可选：安装其他 GNU 工具（根据需要取消注释）
# apt-get install -y \
#     gettext \
#     m4 \
#     texinfo

echo "GNU toolchain installation complete."
