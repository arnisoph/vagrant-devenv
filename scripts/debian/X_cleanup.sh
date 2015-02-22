#!/bin/bash

echo '##############################################'
echo "Starting ${0}.."
set -x

# remove udev rules
rm /etc/udev/rules.d/70-persistent-*.rules
rm -rf /dev/.udev/ /var/lib/dhcp/* /var/lib/dhcp3/*

# remove hardware adress from configuration
#find /etc/sysconfig/network-scripts/ -name 'ifcfg-eth*' -exec sed -i '/^HWADDR/d' {} \;
#find /etc/sysconfig/network-scripts/ -name 'ifcfg-enp*' -exec sed -i '/^HWADDR/d' {} \;
echo "pre-up sleep 2" >> /etc/network/interfaces

# clean up apt repository caches
apt-get clean

rm -rf /usr/share/doc
find /var/cache -type f -delete -print

# Zeroing device to make space...
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove history file
unset HISTFILE
rm -f /root/.bash_history /home/vagrant/.bash_history

if [[ "${DEBUG_PROVISION}" == 'yes' ]]; then
  echo "Taking a nap for \`${SLEEP_SECONDS}' seconds.."
  sleep $SLEEP_SECONDS
fi

