FROM python:alpine
LABEL AUTHOR="Paul Wiggett <mrporcles@gmail.com>"

RUN apk update & apk upgrade & pip install podcats

ADD init.sh /root/

VOLUME ["/music"]

EXPOSE 6000/tcp

CMD ["/bin/sh", "/root/init.sh"]
