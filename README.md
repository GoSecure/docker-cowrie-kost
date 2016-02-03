# gosecure/cowrie

A Docker container for Cowrie - SSH honeypot based on kippo. Minimal image (228.4 MB).

Image is based on the [gliderlabs/alpine](https://registry.hub.docker.com/u/gliderlabs/alpine/) base image.

## Docker usage

```
docker run -p 2222 -p 2223 -v $(pwd)/dl:/home/cowrie/cowrie/dl -v $(pwd)/log:/home/cowrie/cowrie/log gosecure/cowrie
```

Attack surface

* If you don't want SSH exposed, remove `-p 2222`
* If you don't want Telnet exposed, remove `-p 2223`

Volumes are mapped on the host for a convenient access to logs and evidence.

* `dl/` - files transferred from the attacker to the honeypot are stored here
* `log/cowrie.json` - transaction output in JSON format
* `log/cowrie.log` - log/debug output
* `log/tty/*.log` - session logs

## Examples

```
docker run --restart=on-failure:10 -p 2222:2222 gosecure/cowrie
```

```
docker run --restart=always -p 22:2222 gosecure/cowrie
```

## Customize

### Modify fake host

* `cowrie.cfg` - Cowrie's configuration file.
* `data/fs.pickle` - fake filesystem
* `data/userdb.txt` - credentials allowed or disallowed to access the honeypot
* `honeyfs/` - file contents for the fake filesystem - feel free to copy a real system here or use `utils/fsctl.py`
* `txtcmds/` - file contents for the fake commands

### Rebuild the image

```
docker build -t gosecure/cowrie .
```

## Upstream tools

* `utils/createfs.py` - used to create the fake filesystem
* `utils/playlog.py` - utility to replay session logs
