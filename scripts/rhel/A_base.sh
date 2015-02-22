#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

date > /etc/vagrant_box_build_time

if [[ -n "${ROOT_PASSWORD}" ]]; then
  echo "${ROOT_PASSWORD}" | passwd --stdin root
fi
