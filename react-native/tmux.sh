docker build . -t bit
docker run -itd --name bit --restart=always bit sleep infinity
