#!/system/bin/sh
MODDIR=${0%/*}
TARGET=/data/adb/box/scripts
BACKUP="$MODDIR/backup"

if [ -d "$BACKUP" ] && [ -d "$TARGET" ]; then
  for f in net.inotify net.watchdog start.sh; do
    [ -f "$BACKUP/$f" ] && cp -af "$BACKUP/$f" "$TARGET/$f"
  done
fi
