# Cozy V3 Docker Image for the Nuit du Hack

## Running the image

```sh
$ docker run --rm -it -p 1443:1443 cozy/cozy-nuit-du-hack
$ firefox https://cozy.tools:1443/
```

The certificate is self-signed. The password is `kee7BohvDei4phen`

## Build the image

```sh
$ git clone git://github.com/nono/cozy-nuit-du-hack.git
$ cd cozy-nuit-du-hack
$ cp ~/go/src/github.com/cozy/cozy-stack/cozy-stack .
$ docker build -t cozy/cozy-nuit-du-hack .
```
