wget https://releases.ubuntu.com/20.04/ubuntu-20.04.6-live-server-amd64.iso
qemu-img create -f qcow2 linux_disk.img 10G
qemu-system-x86_64 -m 1024 -hda linux_disk.img -cdrom ubuntu-20.04.6-live-server-amd64.iso -boot d -nographic

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
