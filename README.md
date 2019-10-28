# docker-yearning

Dockerized Yearning (https://yearning.io).

[![DockerHub Badge](http://dockeri.co/image/zhangsean/yearning)](https://hub.docker.com/r/zhangsean/yearning/)

## Tags

* `v2.1.4`, `latest`

## Usage

```sh
docker run -itd \
  --name yearning \
  --restart unless-stopped \
  -p 8000:8000 \
  -e MYSQL_ADDR=10.0.1.1:3306 \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=123456 \
  -e MYSQL_DB=yearning \
  zhangsean/yearning
```
