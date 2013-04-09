#!/bin/bash

set -xeu

# Expected to be unbound
INSTALL_VERSION="${1:-}"

if [ -z "$INSTALL_VERSION" ]; then
  echo "usage: $(basename $0) install_version"
  exit 1
fi

if [ -d "/opt/VBoxGuestAdditions-${INSTALL_VERSION}" ]; then
  echo "VirtualBox Guest Additions version ${INSTALL_VERSION} is already installed."
  exit 0
fi

FILENAME="VBoxGuestAdditions_${INSTALL_VERSION}.iso"
DESTFILE="/tmp/${FILENAME}"
MOUNTPOINT="/mnt/vbox_guest_additions"

if [ ! -e "$DESTFILE" ]; then
  curl -# -L http://download.virtualbox.org/virtualbox/${INSTALL_VERSION}/${FILENAME} -o ${DESTFILE}
fi

mkdir -p $MOUNTPOINT
sudo mount ${DESTFILE} -o loop $MOUNTPOINT

sudo sh ${MOUNTPOINT}/VBoxLinuxAdditions.run --nox11
umount $MOUNTPOINT

# cleanning up
rmdir $MOUNTPOINT
# rm $DESTFILE

echo "VirtualBox Guest Additions version ${INSTALL_VERSION} installed successfully."
echo "Please, restart the machine."
exit 0
