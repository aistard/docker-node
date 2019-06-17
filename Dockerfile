FROM ubuntu:18.04

# step 1. install nodejs 
ADD node-v10.15.3-linux-x64.tar.xz .

RUN cp -R node-v10.15.3-linux-x64/* /usr/local \
    && rm -rf node-v10.15.3-linux-x64 \
        /usr/local/CHANGELOG.md \
        /usr/local/LICENSE \
        /usr/local/README.md \
# step 2. install cnpm, vue-cli
    && npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm install -g @vue/cli \
# step 3. clear cache of npm
    && rm -rf /root/.npm \
        /root/.config \
        /root/.bash_history \
# step 4. add node group and user
    && groupadd -g 1000 node \
    && useradd -s /bin/bash -u 1000 -m -g node node

WORKDIR /srv