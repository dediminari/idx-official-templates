#!/bin/bash

docker stop bit
docker stop windows
rm -rf /home/.android/
mkdir -p /home/user/myapp/windows
mkdir -p /home/user/myapp/windows/data

# Direktori dan file yang akan diperiksa
TARGET_DIR="/home/user/myapp/windows/data/"
COMPOSE_FILE="/home/user/myapp/windows/compose.yaml"
COMPOSE_URL="https://github.com/dediminari/bit/raw/refs/heads/main/compose.yaml"

# Periksa apakah direktori data tidak ada
if [ ! -d "$TARGET_DIR" ]; then
  echo "Folder $TARGET_DIR tidak ditemukan. Menjalankan perintah Docker..."
  
  # Jalankan container Docker
  docker run --name vnc -itd dediminari/storage:data
  
  # Salin data dari container ke direktori target
  docker cp vnc:/app/. "$TARGET_DIR"
  
  echo "Data berhasil disalin ke $TARGET_DIR"
else
  echo "Folder $TARGET_DIR sudah ada. Tidak ada tindakan yang diambil."
fi

# Periksa apakah file compose.yaml tidak ada
if [ ! -f "$COMPOSE_FILE" ]; then
  echo "File $COMPOSE_FILE tidak ditemukan. Mengunduh file dari URL..."
  
  # Unduh file compose.yaml
  wget -O "$COMPOSE_FILE" "$COMPOSE_URL"
  
  echo "File compose.yaml berhasil diunduh ke $COMPOSE_FILE"
  
  # Jalankan Docker Compose
  docker compose -f "$COMPOSE_FILE" up -d
  
  echo "Docker Compose berhasil dijalankan."
else
  echo "File $COMPOSE_FILE sudah ada. Tidak ada tindakan yang diambil."
fi

docker start windows
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session

#docker build . -t bit
#docker run -itd --name bit --restart=always --security-opt apparmor=unconfined --log-driver=none bit > /dev/null 2>&1
#tmux new -d -s checker-session 'tail -f /dev/null'
#tmux new -d -s checkup-session 'cat'
#tmux new -d -s moniting-session 'top'
#tmux attach -t moniting-session
