FROM kurron/docker-azul-jdk-8-build:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

ENTRYPOINT ["chromium-browser"]

USER root

RUN apt-get update && apt install --yes chromium-browser libpulse0 pulseaudio

USER powerless
