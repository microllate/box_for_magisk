#!/system/bin/sh

ui_print "- Box Network Debug Patch"
ui_print "- Target: /data/adb/box/scripts"

if [ ! -d /data/adb/box/scripts ]; then
  ui_print "! Existing Box scripts were not found."
  ui_print "! Install the original Box for Root first."
  exit 1
fi

BACKUP="$MODPATH/backup"
mkdir -p "$BACKUP"

for f in net.inotify net.watchdog start.sh; do
  if [ -f "/data/adb/box/scripts/$f" ]; then
    cp -af "/data/adb/box/scripts/$f" "$BACKUP/$f"
  fi
done

cp -af "$MODPATH/payload/net.inotify" /data/adb/box/scripts/net.inotify
cp -af "$MODPATH/payload/net.watchdog" /data/adb/box/scripts/net.watchdog
cp -af "$MODPATH/payload/start.sh" /data/adb/box/scripts/start.sh
chmod 0755 /data/adb/box/scripts/net.inotify /data/adb/box/scripts/net.watchdog /data/adb/box/scripts/start.sh

ui_print "- Patch installed successfully."
ui_print "- Reboot to activate it."
