#! bin/bash -eux

# 邮箱可以自行更改
ssh-keygen -t ed25519 -C "email"


eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

# 快速复制到剪切板
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

# 配置.gitconfig
# 标记提交者，（身份）;协作和追踪
git config --global user.name "name"
git config --global user.email "email"
