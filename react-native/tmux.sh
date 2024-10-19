docker build . -t bit
docker run -itd --name bit --restart=always bit sleep infinity
tmux new -d -s checking-session 'tail -f /dev/null'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session
