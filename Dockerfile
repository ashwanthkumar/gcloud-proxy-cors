FROM staticfloat/nginx-certbot:latest

COPY conf.d /etc/nginx/user.conf.d

