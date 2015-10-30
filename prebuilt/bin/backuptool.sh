#!/sbin/sh
#
# Backup and restore addon /system files
#

export C=/tmp/backupdir
export S=/system
export V=6.0

# Scripts in /system/addon.d expect to find backuptool.functions in /tmp
cp -f /tmp/install/bin/backuptool.functions /tmp

# Backup layers
preserve_layers() {
  mkdir -p /tmp/layers
  cp -a /system/vendor/overlay/* /tmp/layers
  chmod 644 /tmp/layers/*.apk
}

# Restore Layers
restore_layers() {
  mkdir -p /system/vendor/overlay
  cp -a /tmp/layers/* /system/vendor/overlay
  rm -rf /tmp/layers
}

# Backup hosts
preserve_hosts() {
  cp -a /system/etc/hosts /tmp/hosts
  chmod 644 /tmp/hosts
}

# Restore hosts
restore_hosts() {
  cp -a /tmp/hosts /system/etc/hosts
  rm -rf /tmp/hosts
}
# Preserve /system/addon.d in /tmp/addon.d
preserve_addon_d() {
  if [ -d /system/addon.d/ ]; then
    mkdir -p /tmp/addon.d/
    cp -a /system/addon.d/* /tmp/addon.d/
    chmod 755 /tmp/addon.d/*.sh
  fi
}

# Restore /system/addon.d from /tmp/addon.d
restore_addon_d() {
  if [ -d /tmp/addon.d/ ]; then
    cp -a /tmp/addon.d/* /system/addon.d/
    rm -rf /tmp/addon.d/
  fi
}

# Proceed only if /system is the expected major and minor version
check_prereq() {
# If there is no build.prop file the partition is probably empty.
if [ ! -r /system/build.prop ]; then
    return 0
fi
if ( ! grep -q "^ro.build.version.release=$V.*" /system/build.prop ); then
  echo "Not backing up files from incompatible version: $V"
  return 0
fi
}

# Execute /system/addon.d/*.sh scripts with $1 parameter
run_stage() {
if [ -d /tmp/addon.d/ ]; then
  for script in $(find /tmp/addon.d/ -name '*.sh' |sort -n); do
    $script $1
  done
fi
}

case "$1" in
  backup)
    mkdir -p $C
    check_prereq
    preserve_addon_d
    preserve_layers
    preserve_hosts
    run_stage pre-backup
    run_stage backup
    run_stage post-backup
  ;;
  restore)
    check_prereq
    run_stage pre-restore
    run_stage restore
    run_stage post-restore
    restore_addon_d
    restore_layers
    restore_hosts
    rm -rf $C
    sync
  ;;
  *)
    echo "Usage: $0 {backup|restore}"
    exit 1
esac

exit 0
