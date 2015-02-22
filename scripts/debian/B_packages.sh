#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get -y install linux-headers-$(uname -r)

# update package index on boot
cat <<EOF > /etc/init/refresh-apt.conf
description "update package index"
start on networking
task
exec /usr/bin/apt-get update
EOF
