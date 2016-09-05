FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y wget libtommath-dev libicu-dev && \
    mkdir /root/fb && cd /root/fb && wget https://sourceforge.net/projects/firebird/files/firebird-linux-amd64/3.0-Release/Firebird-3.0.0.32483-0.amd64.tar.gz/download && \
    tar xzvpf download && cd Firebird* && ./install.sh -silent

WORKDIR /opt/firebird/bin

ENTRYPOINT [ "fbguard" ]
