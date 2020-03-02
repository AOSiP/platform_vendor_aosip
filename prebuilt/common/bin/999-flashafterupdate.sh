#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/999-flashafterupdate.sh
# For ROMs that don't have "Flash After Update" support built-in.
#
# During an upgrade, this script will flash zips in
# /sdcard/FlashAfterUpdate, /cache/flashafterupdate, /persist/flashafterupdate, and/or /data/flashafterupdate
# after all other addon.d backup/restore actions have completed.
#
# Create a file named "verbose" in the above directory to see all output from flashed zips (only works in recovery).
# Create a file named "silent" in the above directory to hide all script output (only works in recovery).
# Create a file named "log" in the above directory to also log output to that file.
#
# osm0sis @ xda-developers
#

V1_FUNCS=/tmp/backuptool.functions
V2_FUNCS=/postinstall/tmp/backuptool.functions

if [ -f $V1_FUNCS ]; then
  . $V1_FUNCS
  backuptool_ab=false
elif [ -f $V2_FUNCS ]; then
  . $V2_FUNCS
else
  return 1
fi

initialize() {
  ps | grep zygote | grep -v grep >/dev/null && BOOTMODE=true || BOOTMODE=false
  $BOOTMODE || ps -A 2>/dev/null | grep zygote | grep -v grep >/dev/null && BOOTMODE=true
}

main() {
  local altzipdirs i logging metadir ret sdzipdir silent slot tmpzipdir vendor verbose zipdirslist zipdir zip

  # define common working paths
  sdzipdir=/sdcard/FlashAfterUpdate
  altzipdirs="/cache/flashafterupdate /data/flashafterupdate /persist/flashafterupdate"

  (mount /cache
  mount /data
  mount /persist) 2>/dev/null

  # set up sdcard directories if they do not yet exist
  for i in "$sdzipdir" "$sdzipdir/disabled"; do
    if [ ! -d "$i" ]; then
      mkdir "$i"
      chown 1023:1023 "$i"
      chmod 775 "$i"
      chcon u:object_r:media_rw_data_file:s0 "$i"
    fi
  done

  # set up additional alternate directories if they already exists
  zipdirslist="$sdzipdir"
  for i in $altzipdirs; do
    if [ -d "$i" ]; then
      mkdir "$i/disabled"
      chown 0:0 "$i" "$i/disabled"
      chmod 770 "$i" "$i/disabled"
      zipdirslist="$zipdirslist $i"
    fi
  done

  # get display options from any zip directory in list
  for i in $zipdirslist; do
    if [ -f "$i/silent" ]; then
      silent=1
    elif [ -f "$i/verbose" ]; then
      verbose=1
    fi
    if [ -f "$i/log" ]; then
      logging="$i/log"
      rm -f "$logging"
      touch "$logging"
    fi
  done

  # determine parent output fd and ui_print method
  FD=1
  if ! $BOOTMODE && [ ! "$silent" ]; then
    # update-binary|updater <RECOVERY_API_VERSION> <OUTFD> <ZIPFILE>
    OUTFD=$(ps | grep -v 'grep' | grep -oE 'update(.*) 3 [0-9]+' | cut -d" " -f3)
    [ -z $OUTFD ] && OUTFD=$(ps -Af | grep -v 'grep' | grep -oE 'update(.*) 3 [0-9]+' | cut -d" " -f3)
    # update_engine_sideload --payload=file://<ZIPFILE> --offset=<OFFSET> --headers=<HEADERS> --status_fd=<OUTFD>
    [ -z $OUTFD ] && OUTFD=$(ps | grep -v 'grep' | grep -oE 'status_fd=[0-9]+' | cut -d= -f2)
    [ -z $OUTFD ] && OUTFD=$(ps -Af | grep -v 'grep' | grep -oE 'status_fd=[0-9]+' | cut -d= -f2)
    test "$verbose" -a "$OUTFD" && FD=$OUTFD
    ui_print() { echo -e "ui_print $1\nui_print" >> /proc/self/fd/$OUTFD; test "$logging" && echo "$1" >> "$logging"; }
  else
    ui_print() { echo "$1"; test "$logging" && echo "$1" >> "$logging"; }
  fi

  if $backuptool_ab; then
    # define addon.d-v2 working path
    tmpzipdir=/postinstall/tmp/flashafterupd

    # override ui_print (again) when booted
    if $BOOTMODE; then
      ui_print() { log -t FlashAfterUpdate -- "$1"; test "$logging" && echo "$1" >> "$logging"; }
    fi

    # find opposite slot vendor if mountpoint exists
    if [ -L /postinstall/system/vendor -a -d /postinstall/vendor ]; then
      slot=$(getprop ro.boot.slot_suffix 2>/dev/null)
      test "$slot" || slot=$(grep -o 'androidboot.slot_suffix=.*$' /proc/cmdline | cut -d\ -f1 | cut -d= -f2)
      if [ ! "$slot" ]; then
        slot=$(getprop ro.boot.slot 2>/dev/null)
        test "$slot" || slot=$(grep -o 'androidboot.slot=.*$' /proc/cmdline | cut -d\ -f1 | cut -d= -f2)
        test "$slot" && slot=_$slot
      fi
      case $slot in
        _a) slot=_b;;
        _b) slot=_a;;
      esac
      if [ -e /dev/block/by-name/vendor$slot ]; then
        vendor=/dev/block/by-name/vendor$slot
      elif [ -e /dev/block/bootdevice/by-name/vendor$slot ]; then
        vendor=/dev/block/bootdevice/by-name/vendor$slot
      elif [ -e /dev/block/platform/*/by-name/vendor$slot ]; then
        vendor=/dev/block/platform/*/by-name/vendor$slot
      elif [ -e /dev/block/platform/*/*/by-name/vendor$slot ]; then
        vendor=/dev/block/platform/*/*/by-name/vendor$slot
      fi
      if [ "$vendor" ]; then
        vendor=$(ls $vendor 2>/dev/null)
      fi
    fi

    ui_print "*******************************"
    ui_print "* FlashAfterUpdate addon.d-v2"
    ui_print "* by osm0sis @ xda-developers"
    ui_print "*******************************"
  else
    # define addon.d (v1) working path
    tmpzipdir=/tmp/flashafterupd

    # wait out any post-addon.d zip actions (flashing boot.img, etc.)
    sleep 6

    # wait out Magisk's addon.d script which also uses the same background process method
    while [ "$(ps | grep 'magisk/addon.d.sh' | grep -v 'grep')" ]; do
      sleep 1
    done

    ui_print " "
    ui_print "FlashAfterUpdate by osm0sis @ xda-developers"
  fi

  if [ ! "$(find $zipdirslist -type f | grep -vE 'verbose|silent|log|disabled')" ]; then
    $backuptool_ab || ui_print " "
    ui_print "! No files found in '$zipdirslist' to flash"
    exit 1
  fi

  metadir=META-INF/com/google/android
  for zipdir in $zipdirslist; do
    # read zips from directory and unpack
    for zip in "$zipdir"/*; do
      test -d "$zip" && continue
      case "$zip" in
        *silent|*verbose|*log) continue;;
      esac
      $backuptool_ab || ui_print " "
      ui_print "--- Flashing '$zip'..."
      mkdir -p "$tmpzipdir"
      unzip "$zip" -d "$tmpzipdir" -o "$metadir/update-binary" "$metadir/updater-script"
      # update-binary <RECOVERY_API_VERSION> <OUTFD> <ZIPFILE>
      if $backuptool_ab; then
        # run shell update-binary if dummy updater-script indicates addon.d-v2 support
        if ! grep -q '#FLASHAFTERUPDATEV2' "$tmpzipdir/$metadir/updater-script"; then
          ui_print "...Failed! Unsupported zip!"
          rm -rf "$tmpzipdir"
          continue
        fi
        # mount opposite slot vendor to /postinstall/vendor if appropriate
        if [ -e "$vendor" ]; then
           mount -o rw -t auto $vendor /postinstall/vendor
        fi
        sh "$tmpzipdir/$metadir/update-binary" 3 $FD "$zip"
        umount /postinstall/vendor 2>/dev/null
      else
        # addon.d (v1) supports all flashable zips so run update-binary directly
        chmod 755 "$tmpzipdir/$metadir/update-binary"
        "$tmpzipdir/$metadir/update-binary" 3 $FD "$zip"
      fi
      ret=$?
      test $ret != 0 && ui_print "...Failed! Exit code: $ret" || ui_print "...Succeeded!"
      rm -rf "$tmpzipdir"
    done
  done

  if ! $BOOTMODE; then
    ui_print " "
    test "$silent" || sleep 10
  fi
  exit 0
}

case "$1" in
  backup)
    # Stub
  ;;
  restore)
    # Stub
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    initialize
    if $backuptool_ab; then
      # addon.d-v2 requires root when booted
      $BOOTMODE && su=su || su=sh
      exec $su -c "sh $0 addond-v2"
    else
      # run in background, hack for addon.d (v1)
      (main) &
    fi
  ;;
  addond-v2)
    initialize
    main
  ;;
esac
