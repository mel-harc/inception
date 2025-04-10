#!/bin/bash

openssl req -x509 -nodes -out /etc/nginx/ssl/nginx.crt -keyout /etc/nginx/ssl/nginx.key -subj "/C=MO/L=khouribga/O=1337/OU=1337/CN=mel-harc.42.fr/UID=mel-harc"

echo "events
        {
            
        }
        http
        {
            include       mime.types;
            default_type  application/octet-stream;
            server {
                listen  443 ssl;
                ssl_protocols TLSv1.3;
                ssl_certificate /etc/nginx/ssl/nginx.crt;
                ssl_certificate_key /etc/nginx/ssl/nginx.key;
                
                
                root /var/www/html;
                server_name ${DOMAIN_NAME};
                index index.php index.html index.htm;
                
                location ~ \.php$ {								# For every php request
                    include snippets/fastcgi-php.conf;
                    fastcgi_pass wordpress:9000;
                }
            }
        }
        " > etc/nginx/nginx.conf

nginx -g "daemon off;"
