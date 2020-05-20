#!/bin/bash
# ==== usage ====
# latest build: ./build.sh 
# specific version build: ./build.sh <version> (e.g. ./build.sh 2018.04.22c)

build_latest() {
	set -ex
	curl -L https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz -o archive/dokuwiki-stable.tgz
	tar xzf archive/dokuwiki-stable.tgz -C .
	TAG=$(ls |grep dokuwiki- |sed -e "s/-/./g" |awk -F 'dokuwiki.' '{print $2}')
	mv dokuwiki-* dokuwiki
	sudo docker build -t pyowonil/dokuwiki:$TAG .
	sudo docker build -t pyowonil/dokuwiki:latest .
}

build_specific() {
	TAG=$1
	if [[ ! -f archive/dokuwiki-$TAG.tgz ]]
	then
		echo "[-] unknown tag: $TAG"
		exit 1
	fi

	set -ex
	tar xzf archive/dokuwiki-$TAG.tgz -C .
	mv dokuwiki-* dokuwiki
	sudo docker build -t pyowonil/dokuwiki:$TAG .
}

if [[ -z "$1" ]]
then
	build_latest
else
	build_specific $1
fi
