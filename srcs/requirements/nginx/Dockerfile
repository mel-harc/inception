FROM    debian:buster

RUN     apt update -y

RUN     apt install nginx -y

RUN     mkdir -p /etc/nginx/ssl

RUN     apt install openssl -y

COPY    tools/nginx.sh /copy/

RUN     chmod +x /copy/nginx.sh

CMD ["./copy/nginx.sh"]
