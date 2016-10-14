FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y wget libtommath-dev libicu-dev && \
    mkdir /root/fb && cd /root/fb && wget https://sourceforge.net/projects/firebird/files/firebird-linux-amd64/3.0-Release/Firebird-3.0.0.32483-0.amd64.tar.gz/download && \
    tar xzvpf download && cd Firebird* && ./install.sh -silent && \
    echo "DatabaseAccess = Full" >>/opt/firebird/firebird.conf && \
    echo "ServerMode = SuperClassic" >>/opt/firebird/firebird.conf && \
    echo "WireCrypt = Enabled" >>/opt/firebird/firebird.conf && \
    echo "AuthServer = Srp, Win_Sspi, Legacy_Auth" >>/opt/firebird/firebird.conf && \
    echo "UserManager = Srp, Legacy_UserManager" >>/opt/firebird/firebird.conf

WORKDIR /opt/firebird/bin

VOLUME [ "/databases" ]

EXPOSE 3050

ENTRYPOINT [ "./fbguard" ]
