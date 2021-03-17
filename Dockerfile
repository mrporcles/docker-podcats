FROM python:3.7.9-alpine3.12
LABEL AUTHOR="Paul Wiggett <mrporcles@gmail.com>"

RUN apk update & apk upgrade & pip install podcats

VOLUME ["/music"]

EXPOSE 5000/tcp

CMD /usr/local/bin/podcats serve /music --host 0.0.0.0 --title "$PODCATS_TITLE"