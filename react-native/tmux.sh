docker build . -t bit
docker run -it --name bit --restart=always bit sleep infinity
