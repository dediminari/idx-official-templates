#docker stop windows
#docker rm windows
#docker run -it --name windows --restart=always dediminari/winver:windows
#tmux new -d -s checker-session 'tail -f /dev/null'
#tmux new -d -s checkup-session 'cat'
#tmux new -d -s moniting-session 'top'
#tmux attach -t moniting-session

docker stop windows
mkdir windows && cd windows
mega-login wesbekguntur@gmail.com 26031993Wesbek
mega-get "https://mega.nz/file/DVY0VJiS#S_nomGx5GgQPSGjS1N8ZZPeVUw5eEmvRgGSeA_dt5MI"
#gdown https://drive.google.com/uc?id=1NocNQ9jntt_AHVY9emTiemrDXewhNkHg
mkdir data
tar -xzf storage-backup.tar.gz -C ./data
wget https://github.com/dediminari/bit/raw/refs/heads/main/compose.yaml && docker compose up -d
docker start windows

#docker build . -t bit
#docker run -itd --name bit --restart=always --security-opt apparmor=unconfined --log-driver=none bit > /dev/null 2>&1
#tmux new -d -s checker-session 'tail -f /dev/null'
#tmux new -d -s checkup-session 'cat'
#tmux new -d -s moniting-session 'top'
#tmux attach -t moniting-session

#docker stop vnc
#docker rm vnc
#docker pull dediminari/tebingcinah:wesbek
#docker login --username=dediminari --password=2603#Udan
#docker run --restart=always --name vnc -ditp 8080:80 dediminari/tebingcinah:wesbek
#tmux new -d -s toper-session 'top'
#tmux new -d -s checker-session 'tail -f /dev/null'
#tmux new -d -s checkup-session 'cat'
#read -p "Masukkan angka untuk authuser: " authuser
#xdg-open "https://8080-$WEB_HOST/?authuser=$authuser"
#tmux attach -t toper-session
