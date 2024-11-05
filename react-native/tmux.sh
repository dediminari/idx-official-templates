docker build . -t bit
docker run -itd --name bit --restart=always bit sleep infinity
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checking-session 'while true; do :; done'
tmux new -d -s checknow-session 'while true; do sleep 60; done'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session
