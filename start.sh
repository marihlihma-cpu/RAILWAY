#!/bin/sh
set -e
: "${PROXY_USER:?Defina PROXY_USER}"
: "${PROXY_PASS:?Defina PROXY_PASS}"
cat > /etc/tinyproxy/tinyproxy.conf <<CONF
Port 8888
Listen 0.0.0.0
Timeout 60
MaxClients 100
LogLevel Info
DisableViaHeader Yes
BasicAuth ${PROXY_USER} ${PROXY_PASS}
ConnectPort 443
ConnectPort 80
CONF
exec tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf
