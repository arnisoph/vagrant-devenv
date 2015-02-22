#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

yum -y update
yum -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r)
