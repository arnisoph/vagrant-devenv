#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

yum -y update
yum -y install \
  kernel-headers-$(uname -r) \
  kernel-devel-$(uname -r) \
  epel-release \
  perl \
  make \
  gcc \
  bzip2 \
  curl \
  dhclient \
  less \
  logrotate \
  openssh \
  openssh-clients \
  openssh-server \
  rsync \
  sudo \
  unzip \
  wget \
  which
