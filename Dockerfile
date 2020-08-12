FROM debian:buster

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y  nginx \
    mariadb-server \
    wget \
    php7.3 \
    php-fpm \
    php-mysql \ 
    php-cli \
    php-mbstring	

COPY srcs /root/

RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN bash /root/server-config.sh

ENTRYPOINT bash /root/start.sh

CMD bash

