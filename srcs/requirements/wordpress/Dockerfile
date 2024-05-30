FROM debian:bullseye

RUN apt-get update -y  && apt install -y curl

RUN apt install -y php php-mysql php-fpm mariadb-client

RUN  mkdir -p /run/php

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wp.sh /

RUN chmod +x /wp.sh

CMD ["./wp.sh"]
