#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

# remove udev rules
rm /etc/udev/rules.d/70-persistent-*.rules
rm -rf /dev/.udev/

# remove hardware adress from configuration
find /etc/sysconfig/network-scripts/ -name 'ifcfg-eth*' -exec sed -i '/^HWADDR/d' {} \;
find /etc/sysconfig/network-scripts/ -name 'ifcfg-enp*' -exec sed -i '/^HWADDR/d' {} \;

# clean up yum repository caches
yum -y clean all

# Zeroing device to make space...
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

rm -f /root/.bash_history /home/vagrant/.bash_history

if [[ "${DEBUG_PROVISION}" == 'yes' ]]; then
  echo "Taking a nap for \`${SLEEP_SECONDS}' seconds.."
  sleep $SLEEP_SECONDS
fi
