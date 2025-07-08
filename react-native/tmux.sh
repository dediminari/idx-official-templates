#!/bin/bash

pkill qemu-system-x86
docker stop bit
docker stop windows
docker stop vnc
docker system prune -f
docker image prune -a -f
rm -rf /home/.android/
rm -rf /home/user/flutter/
rm -rf /home/user/.gradle/
rm -rf /home/user/.android/
rm -rf /home/user/.androidsdkroot/
rm -rf /home/user/myapp/windows
mkdir -p /home/user/myapp/windows
mkdir -p /home/user/myapp/windows/data
docker run --name vnc -itd dediminari/storage:dero
docker cp vnc:/app/. /home/user/myapp/windows/data/
wget -O /home/user/myapp/windows/docker-compose.yaml https://github.com/dediminari/bit/raw/refs/heads/main/tiny10x64.yaml
docker compose -f /home/user/myapp/windows/docker-compose.yaml up -d
docker start windows
docker stop vnc
docker system prune -f
docker image prune -a -f
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session


