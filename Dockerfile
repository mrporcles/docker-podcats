FROM python:alpine
LABEL AUTHOR="Paul Wiggett <mrporcles@gmail.com>"

RUN apk update & apk upgrade
RUN apk add git
RUN pip install git+https://github.com/mrporcles/podcats@external

ADD init.sh /root/

VOLUME ["/music"]

EXPOSE 5000/tcp

CMD ["/bin/sh", "/root/init.sh"]
