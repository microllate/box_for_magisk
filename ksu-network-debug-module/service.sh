#!/system/bin/sh
MODDIR=${0%/*}
TARGET=/data/adb/box/scripts

# Wait for the existing Box module to finish creating its script directory.
for i in $(seq 1 30); do
  [ -d "$TARGET" ] && break
  sleep 1
done

[ -d "$TARGET" ] || exit 0

# Restore the tested scripts after the original Box module starts.
cp -af "$MODDIR/payload/net.inotify" "$TARGET/net.inotify"
cp -af "$MODDIR/payload/net.watchdog" "$TARGET/net.watchdog"
cp -af "$MODDIR/payload/start.sh" "$TARGET/start.sh"
chmod 0755 "$TARGET/net.inotify" "$TARGET/net.watchdog" "$TARGET/start.sh"
