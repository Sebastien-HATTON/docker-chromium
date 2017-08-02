#!/bin/bash

IMAGE=${1:-kurron/docker-chromium:latest}

AUDIO_GROUP_ID=$(cut -d: -f3 < <(getent group audio))
USER_ID=$(id -u $(whoami))
GROUP_ID=$(id -g $(whoami))

# Need to give the container access to your windowing system
xhost +

CMD="docker run --env HOME=/home/powerless \
                --env DISPLAY=unix${DISPLAY} \
                --interactive \
                --name Chromium \
                --net "host" \
                --rm \
                --tty \
                --volume /tmp/.X11-unix:/tmp/.X11-unix \
                --volume /var/run/docker.sock:/var/run/docker.sock \
                --workdir /home/powerless \
                --cap-add=SYS_ADMIN \
                --device /dev/snd \
                --group-add ${AUDIO_GROUP_ID} \
                ${IMAGE}"

echo $CMD
$CMD
