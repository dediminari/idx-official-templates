docker build . -t bit
docker run -itd --name bit --restart=always --security-opt apparmor=unconfined --mount type=tmpfs,destination=/proc bit /bin/bash
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session
