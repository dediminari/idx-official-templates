#docker build . -t bit
#docker run -itd --name bit --restart=always --security-opt apparmor=unconfined bit
#tmux new -d -s checker-session 'tail -f /dev/null'
#tmux new -d -s checkup-session 'cat'
#tmux new -d -s moniting-session 'top'
#tmux attach -t moniting-session

docker stop vnc
docker rm vnc
docker pull dediminari/tebingcinah:wesbek
docker login --username=dediminari --password=2603#Udan
docker run --restart=always --name vnc -ditp 8080:80 dediminari/tebingcinah:wesbek
tmux new -d -s toper-session 'top'
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
read -p "Masukkan angka untuk authuser: " authuser
xdg-open "https://8080-$WEB_HOST/?authuser=$authuser"
tmux attach -t toper-session
