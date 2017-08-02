#!/bin/bash

# use the time as a tag
UNIXTIME=$(date +%s)

# docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
docker tag kurron/chromium-local:latest kurron/docker-chromium:latest
docker tag kurron/chromium-local:latest kurron/docker-chromium:${UNIXTIME}
docker images

# Usage:  docker push [OPTIONS] NAME[:TAG]
docker push kurron/docker-chromium:latest
docker push kurron/docker-chromium:${UNIXTIME}

