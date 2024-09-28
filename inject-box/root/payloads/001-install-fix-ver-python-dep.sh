#!/usr/bin/env bash
cd /home/app
wine pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
wine pip install -r requirements.txt
