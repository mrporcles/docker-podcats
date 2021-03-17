# podcats

This repo contains a Dockerfile to run [podcats](https://github.com/jakubroztocil/podcats) in a container with all required pre-reqs.

Volume */music* should be mapped to the location of local media files.

RSS feed and web interface are exposed via TCP port 5000

Use the *PODCATS_TITLE* environment variable to add a custom title for the RSS feed. It will default to the name of the music directory.
