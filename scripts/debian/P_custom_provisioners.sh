#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

IFS=,
provisioners=( ${CUSTOM_PROVISIONERS} )
unset IFS

for p in ${provisioners[@]}; do
  dir=/tmp/packer-provision/custom_provisioners/${p}
  if [[ -d $dir ]]; then
    for f in ${dir}/*.sh; do
      ${f}
    done
  fi
done
