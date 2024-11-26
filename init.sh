#!/bin/sh

# exit script if return code != 0
set -e

podcats --host "$PODCATS_HOSTNAME" --title "$PODCATS_TITLE" generate "$PODCATS_MUSIC" > /usr/share/nginx/html/podcast.xml

podcats --host "$PODCATS_HOSTNAME" --title "$PODCATS_TITLE" generate_html "$PODCATS_MUSIC" |sed 's/\\n//g' |sed 's/^..//' > /usr/share/nginx/html/podcast.html

ln -s "$PODCATS_MUSIC" /usr/share/nginx/html/static || true

nginx -g 'daemon off;'
