# Linux Config Scripts 🐧

<p align="center">
  <img src="https://img.shields.io/badge/OS-Linux%20(Debian%2FUbuntu)-orange" alt="OS: Linux (Debian/Ubuntu)">
  <img src="https://img.shields.io/badge/Shell-Bash-blue" alt="Shell: Bash">
  <img src="https://img.shields.io/badge/License-MIT%20(Suggested)-brightgreen" alt="License: MIT (Suggested)">
</p>

一套用于快速配置 Linux (侧重于 Debian/Ubuntu 发行版) 环境的个人脚本集合。

## ✨ 简介

该仓库包含一系列 Bash 脚本，旨在自动化在新安装的 Linux 系统上配置开发环境和常用工具的过程。这些脚本涵盖了软件包安装、环境配置、工具设置等方面。

**注意:** 这些脚本是根据个人需求编写的，请在使用前仔细检查脚本内容，并根据自己的实际情况进行修改。

## 🚀 脚本功能

| 脚本文件              | 功能描述                                                       | 备注                                     |
| :-------------------- | :------------------------------------------------------------- | :--------------------------------------- |
| `install_pack.sh`     | 安装常用的基础命令行工具 (vim, git, curl, wget, htop, zsh 等) | 推荐使用此版本 (有安装成功/失败追踪)   |
| `install_gnu.sh`      | 安装 GNU Toolchain (build-essential, gdb, make 等)             | 需要 `sudo` 权限                         |
| `install_zsh.sh`      | 安装 Oh My Zsh (依赖 `wget` 和 `git`)                          | 脚本内调用了 Oh My Zsh 官方安装脚本    |
| `install.sh`          | **Oh My Zsh 官方安装脚本** | 这是官方脚本，被 `install_zsh.sh` 调用  |
| `install_conda.sh`    | 下载并安装指定版本的 Anaconda Python 发行版，并配置 Zsh 环境   | 需要手动修改脚本内的 Anaconda 版本和路径 |
| `install_code.sh`     | 添加 Microsoft 仓库并安装 Visual Studio Code                   | 需要 `sudo` 权限                         |
| `install_im.sh`       | 安装 Fcitx5 输入法框架及中文支持，下载词库                   | 需要 `sudo` 权限                         |
| `pip_config.sh`       | 配置 pip 使用清华大学镜像源                                    |                                          |
| `install_gdbinit.sh`  | 下载 gdb-dashboard 的 `.gdbinit` 配置文件并安装 `pygments`    |                                          |
| `ssh_config.sh`       | 生成 SSH 密钥 (ed25519)，添加到 ssh-agent，配置 Git 用户信息 | **需要修改邮箱和用户名** |


## 🛠️ 使用方法

1.  **克隆仓库:**
    ```bash
    git clone https://github.com/uvmplus/linux_config_scripts.git
    cd linux_config_scripts
    ```

2.  **赋予执行权限:**
    ```bash
    chmod +x *.sh
    ```

3.  **检查并修改脚本:**
    * **非常重要:** 打开每个你打算运行的脚本，仔细阅读其内容。
    * **修改个人信息:** 特别是 `ssh_config.sh` 或 `ssh.sh` 中的 **邮箱地址** 和 **Git 用户名**。
    * **修改硬编码路径/版本:** 例如 `install_conda.sh` 中的 Anaconda 版本和 `.zshrc` 中可能硬编码的**用户名** (`belle`)。
    * **检查软件包列表:** 根据你的需要增删 `install_pack.sh` 或 `package.sh` 中的软件包。

4.  **按需执行脚本:**
    * 建议 **逐个** 运行你需要的脚本，而不是一次性全部运行。
    * 需要管理员权限的脚本，请使用 `sudo` 执行。

    **示例:**
    ```bash
    # 安装基础包 (需要 sudo)
    sudo ./install_pack.sh

    # 配置 SSH 和 Git (不需要 sudo，但需要修改脚本！)
    ./ssh_config.sh # 或 ./ssh.sh

    # 安装 Anaconda (不需要 sudo，但需要修改脚本！)
    ./install_conda.sh

    # 配置 pip 镜像 (不需要 sudo)
    ./pip_config.sh

    # 安装 VS Code (需要 sudo)
    sudo ./install_code.sh

    # ... 其他脚本按需执行
    ```

## ⚠️ 注意事项

* **风险自负:** 在执行任何脚本之前，请务必理解其功能和潜在影响。尤其对于需要 `sudo` 权限的脚本，请谨慎操作。错误的操作可能会对你的系统造成损害。
* **个性化配置:** 这些脚本是个人配置，不一定完全适用于所有用户或所有环境。请根据自己的需求进行调整。
* **硬编码信息:** 脚本中可能包含硬编码的用户名（如 `belle`）、邮箱地址或特定版本号。请务必查找并替换为你自己的信息。
* **脚本依赖:** 某些脚本可能依赖于其他脚本先执行（例如，安装 `zsh` 后才能配置 `conda` 到 `.zshrc`）。
* **网络依赖:** 大部分脚本需要连接互联网以下载软件包或配置文件。

## 🤝 贡献

如果你发现任何问题或有改进建议，欢迎提交 Issues 或 Pull Requests。
