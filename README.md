# 安装说明

> 请确认系统已经安装`docker-ce`和`docker-composer`，否则无法正常使用

1. `clone` 代码到本地

```bash
git clone git@git.augmentum.com.cn:knight.chen/docker-node.git
```

2. 安装docker-node

进入目录执行`install.sh`文件

```bash
cd docker-node
./install.sh -s /bin/bash -l
# -s 指定目前使用的shell, 例如/bin/zsh等
# -l 是否希望维持自己安装的全局node_modules, 不加-l时，执行 npm install -g 安装的modules将无效
```

3. 检查安装是否成功

```bash
node --version
```

> 提示：环境中已经内置 `npm` `npx` `cnpm` `vue`命令，镜像已修改为淘宝镜像

4. 卸载环境

将 `~/.bashrc` 的这三行删除
```bash
# docker alias
export NODE_DIR="$HOME/.docker/docker-node"
[ -e $NODE_DIR/docker-alias.sh ] && source $NODE_DIR/docker-alias.sh
```
执行命令
```bash
source ~/.bashrc
sudo rm -rf ~/.docker/docker-node
# 删除镜像
docker image rm ubuntu:18.04
docker image rm xy599505/node
```
