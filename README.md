# dokuwiki

## use

### init

```sh
sudo docker run --rm -it \
    -p 8080:80 \
    -v ${PWD}/dokuwiki:/var/www/dokuwiki \
    pyowonil/dokuwiki:latest
```

### install

visit `http://IP-address-of-your-server/install.php`

### after install

```sh
DOKUWIKI_ID=$(sudo docker ps \
    |grep "pyowonil/dokuwiki" \
    |awk '{print $1}')
sudo docker exec \
    ${DOKUWIKI_ID} \
    /afterinstall.sh
```

## build

### latest

```sh
./build.sh
```

### specific

```sh
./build.sh 2018.04.22c
```
