FROM alpine

LABEL maintainer="zhangsean <zxf2342@qq.com>"

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2; \
    echo "http://mirrors.ustc.edu.cn/alpine/v3.12/main/" > /etc/apk/repositories; \
    apk add --no-cache tzdata; \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    echo "Asia/Shanghai" >> /etc/timezone; \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

EXPOSE 8000

ARG YEARNING_VER="v3.0.0"
ARG YEARNING_URL=https://github.com/cookieY/Yearning/releases/download/v3.0.0/Yearning-v3.0.0-linux-amd64.zip
RUN wget -cqO yearning.zip $YEARNING_URL; \
    unzip yearning.zip -d /; \
    rm -f yearning.zip

WORKDIR /Yearning/

ENTRYPOINT  ["./Yearning"]

CMD ["run"]
