#!/bin/bash -e

install -v -d -m 0755 "${ROOTFS_DIR}/etc/mycroft"
install -v -m 0644 files/mycroft.conf "${ROOTFS_DIR}/etc/mycroft/mycroft.conf"

install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.local"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.local/state"
install -v -d -m 0755 "${ROOTFS_DIR}/home/ovos/.local/state/mycroft"

install -v -d -m 0755 "${ROOTFS_DIR}/etc/environment.d"
install -v -m 0644 files/99-ovos-environment.conf "${ROOTFS_DIR}/etc/environment.d/99-ovos-environment.conf"

if [[ -e "${ROOTFS_DIR}/etc/environment" ]]; then
on_chroot << EOF

ln -s /etc/environment /etc/environment.d/99-environment

EOF
fi

install -v -m 0644 files/hive-voice-sat.service "${ROOTFS_DIR}/etc/systemd/user/hive-voice-sat.service"

install -v -m 0755 files/hive_systemd_voice_sat "${ROOTFS_DIR}/usr/libexec/hive_systemd_voice_sat"

echo "enable hive-voice-sat.service" >> "${ROOTFS_DIR}/etc/systemd/user-preset/10-ovos-user.preset"
