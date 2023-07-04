#!/bin/bash -e

# Create a ramdisk
echo "tmpfs /ramdisk tmpfs rw,nodev,nosuid,size=20M 0 0" >> "${ROOTFS_DIR}/etc/fstab"
# TODO: setup swap space
# DONE: uses zram. setup with run-chroot.sh

install -v -m 0644 files/97-ovos.conf "${ROOTFS_DIR}/etc/sysctl.d/97-ovos.conf"

# Autologin ovos/$FIRST_USER_NAME to cosnole
sed -i "s|\bovos\b|${FIRST_USER_NAME}|g" files/autologin.conf
install -v -m 0644 files/autologin.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf"

install -v -d -m 0755 "${ROOTFS_DIR}/etc/sudoers.d"

install -v -m 0644 files/ovos-sudo "${ROOTFS_DIR}/etc/sudoers.d/ovos"

install -v -d -m 0755 "${ROOTFS_DIR}/etc/systemd/system-preset"
install -v -m 0644 files/10-ovos-system.preset "${ROOTFS_DIR}/etc/systemd/system-preset/10-ovos-system.preset"
install -v -m 0644 files/99-ovos-default.preset "${ROOTFS_DIR}/etc/systemd/system-preset/99-ovos-default.preset"
install -v -d -m 0755 "${ROOTFS_DIR}/etc/systemd/user-preset"
install -v -m 0644 files/10-ovos-user.preset "${ROOTFS_DIR}/etc/systemd/user-preset/10-ovos-user.preset"
install -v -m 0644 files/99-ovos-user-default.preset "${ROOTFS_DIR}/etc/systemd/user-preset/99-ovos-user-default.preset"

install -v -d -m 0755 "${ROOTFS_DIR}/tmp/mycroft"

# Create directory for systemd hooks
install -v -d -m 0755 "${ROOTFS_DIR}/usr/libexec"

on_chroot << EOF

chown -R ovos:ovos /tmp/

if [[ -e /etc/locale.gen ]]; then
	rm "/etc/locale.gen"
fi

dpkg-reconfigure --frontend noninteractive locales

sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

EOF
