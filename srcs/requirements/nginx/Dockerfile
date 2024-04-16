FROM    debian:buster

RUN     apt update -y

RUN     apt install nginx -y

RUN     apt install vim -y

RUN     apt install curl -y

RUN     mkdir -p /etc/nginx/ssl

RUN     apt install OpenSSL -y

COPY    tools/nginx.sh /copy/

RUN     chmod +x /copy/nginx.sh

CMD ["./copy/nginx.sh"]