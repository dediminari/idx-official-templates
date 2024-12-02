docker build . -t bit
docker run -itd --name bit --tmpfs /tmp:size=64m --cap-drop=ALL --cap-add=NET_RAW --cap-add=SYS_NICE --restart=always --security-opt apparmor=unconfined --log-driver=none bit > /dev/null 2>&1
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session

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
