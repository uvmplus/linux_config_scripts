#! /bin/bash -ex

mkdir ~/.pip

echo "[global]" >> ~/.pip/pip.conf
echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf

pip config list

# 应该能看到如下输出
# global.index-url='https://pypi.tuna.tsinghua.edu.cn/simple'