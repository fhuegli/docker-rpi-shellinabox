#!/bin/bash
docker build -t fhuegli/rpi-shellinabox-alpine-build -f Dockerfile.build .
docker run --rm fhuegli/rpi-shellinabox-alpine-build > ./files/shellinabox.tar.gz
