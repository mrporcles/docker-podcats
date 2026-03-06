#!/bin/sh

# exit script if return code != 0
set -e

# Enable basic auth if credentials are provided
if [ -n "$WEB_USER" ] && [ -n "$WEB_PASS" ]; then
    htpasswd -bc /etc/nginx/.htpasswd "$WEB_USER" "$WEB_PASS"
    sed -i 's|#AUTH_PLACEHOLDER|auth_basic "Restricted Access";\n        auth_basic_user_file /etc/nginx/.htpasswd;|' /etc/nginx/conf.d/default.conf
fi

podcats --host "$PODCATS_HOSTNAME" --title "$PODCATS_TITLE" --link "$PODCATS_LINK" --description "$PODCATS_DESCRIPTION" generate "$PODCATS_MUSIC" > /usr/share/nginx/html/podcast.xml

podcats --host "$PODCATS_HOSTNAME" --title "$PODCATS_TITLE" --link "$PODCATS_LINK" --description "$PODCATS_DESCRIPTION" generate_html "$PODCATS_MUSIC" > /usr/share/nginx/html/podcast.html

ln -s "$PODCATS_MUSIC" /usr/share/nginx/html/static || true

nginx -g 'daemon off;'
