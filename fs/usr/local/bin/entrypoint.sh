#!/bin/ash

quit() {
  wg-quick down wg0
}

trap quit INT TERM EXIT

if [ -z "${1}" ]; then
  if [ ! -f "/opt/wireguard/etc/wg0.conf"  ]; then
    echo "configuration file not found"; exit 1
  fi

  set -- inotifywait --quiet --monitor --event MODIFY /opt/wireguard/etc/wg0.conf && wg-quick up /opt/wireguard/etc/wg0.conf
fi

exec "$@"
