# gosecure/cowrie

A Docker container for Cowrie - SSH honeypot based on kippo. Minimal image (228.4 MB).

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image.

## Docker usage

```
docker run -p 2222 -v $(pwd)/dl:/home/cowrie/cowrie/dl -v $(pwd)/log:/home/cowrie/cowrie/log gosecure/cowrie
```

Volumes are mapped on the host for a convenient access to logs and evidence.

* dl/
* log/
* log/tty/

## Examples

```
docker run --restart=on-failure:10 -p 2222:2222 gosecure/cowrie
```

```
docker run --restart=always -p 22:2222 gosecure/cowrie
```

## Configuration changes

If any changes are made to `cowrie.cfg` or `userdb.txt` the docker image needs to be rebuilt with:

```
docker build -t gosecure/cowrie .
```
