docker build . -t bit
docker run -itd --name bit --pid=private --restart=always bit sleep infinity
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session
