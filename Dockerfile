FROM alpine:latest

LABEL maintainer="HenryYee-2019/08/13"

EXPOSE 8000

COPY Yearning  /opt/Yearning
COPY dist /opt/dist
COPY conf.toml /opt/conf.toml

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.3/main/" > /etc/apk/repositories
RUN apk add --no-cache tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" >> /etc/timezone
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

WORKDIR /opt

ENTRYPOINT  ["/opt/Yearning"]

CMD ["-m", "-s"]
