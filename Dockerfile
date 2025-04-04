FROM alpine:3.21.3

RUN set -ex; \
  apk --update --no-cache upgrade; \
  apk add --no-cache \
    iptables \
    inotify-tools \
    wireguard-tools; \
    mkdir -p /opt/wireguard/etc;

COPY ./fs /

RUN set -ex; \
  chmod +x -R /usr/local/bin

VOLUME ["/opt/wireguard/etc"]

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
