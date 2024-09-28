#!/usr/bin/env bash
mkdir docker_buiding || true
# update injector-box
if [ ! -d docker_buiding/injector-box ]; then
    cp -r inject-box docker_buiding/injector-box
else
    rm -r docker_buiding/injector-box
    cp -r inject-box docker_buiding/injector-box
fi
if [ ! -d docker_buiding/injector-box/target ]; then
    git clone https://github.com/HenryXiaoYang/wechat-box-wcferry docker_buiding/injector-box/target
else
    cd docker_buiding/injector-box/target
    git pull
    cd -
fi

if [ ! -f WeChatSetup-3.9.10.27.exe ]; then
  wget https://file.yangres.com/WeChatSetup-3.9.10.27.exe
fi

if [ ! -f docker_buiding/injector-box/target/root/WeChatSetup-3.9.10.27.exe ]; then
    cp WeChatSetup-3.9.10.27.exe docker_buiding/injector-box/target/root
fi

cp bin_deps/* docker_buiding/injector-box/root/drive_c/injector
cd docker_buiding/injector-box
sudo docker build -t "henryxiaoyang/wechat-service-wcferry:latest" . --progress=plain
