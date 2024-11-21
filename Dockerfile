FROM nginx:alpine
LABEL AUTHOR="Paul Wiggett <mrporcles@gmail.com>"

ARG PODCATS_HOSTNAME=build
ARG PODCATS_MUSIC="/music"
ARG PODCATS_TITLE="test"

RUN apk update && apk add git py-pip && apk upgrade && pip install git+https://github.com/mrporcles/podcats@external --break-system-packages

VOLUME ["/music"]

EXPOSE 80/tcp

ADD init.sh /root/
ADD default.conf /etc/nginx/conf.d

CMD ["/bin/sh", "/root/init.sh"]