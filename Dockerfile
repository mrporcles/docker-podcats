FROM python:3.7.9-alpine3.12
LABEL AUTHOR="Paul Wiggett <mrporcles@gmail.com>"

RUN apk update & apk upgrade & pip install podcats

ADD init.sh /root/

VOLUME ["/music"]

EXPOSE 5000/tcp

CMD ["/bin/sh", "/root/init.sh"]