# podcats

This repo contains a Dockerfile to run [podcats](https://github.com/jakubroztocil/podcats) in a container with all required pre-reqs.

* Volume */music* should be mapped to the location of local media files.

* Container is designed to be run utilising the host network so the web interface can reach the static web links for the media files.

* Use the *PODCATS_TITLE* environment variable to add a custom title for the RSS feed. It will default to the name of the music directory.

## Example usage

```sh
docker run -d --name='podcats' --net='host' -e 'PODCATS_TITLE'='My Cool Music' -e 'TCP_PORT_5000'='5000' -v '/localmusic':'/music':'ro,slave' -e "BRIDGE_IP=$(ip -4 addr show br0 | grep -Po 'inet \K[\d.]+')" 'mrporcles/podcats:latest'
```

25-11-2021
27-09-2021
