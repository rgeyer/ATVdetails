FROM mysql:latest

RUN apt-get update && \
    apt-get install curl --no-install-recommends -y && \
    rm -rf /tmp/* && \
    mkdir -p /usr/src/app && \
    echo "wait=5m" > /usr/src/app/config.ini

COPY . /usr/src/app/
