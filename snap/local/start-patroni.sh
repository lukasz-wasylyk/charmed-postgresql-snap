#!/bin/bash

# For security measures, daemons should not be run as sudo. Execute patroni as the non-sudo user: snap_daemon.
export LOCPATH="${SNAP}"/usr/lib/locale

$SNAP/usr/bin/setpriv --clear-groups --reuid snap_daemon --regid snap_daemon -- mkdir -p $SNAP_DATA/etc/patronii
ls -la $SNAP_DATA/etc

if [ ! -e $SNAP_DATA/etc/patronii/patroni.yaml ]; then
  cp $SNAP/config/patroni.yaml $SNAP_DATA/etc/patronii
fi
ls -la $SNAP_DATA/etc/patronii
cat $SNAP_DATA/etc/patronii/patroni.yaml

$SNAP/usr/bin/setpriv --clear-groups --reuid snap_daemon \
  --regid snap_daemon -- $SNAP/usr/bin/patroni $SNAP_DATA/etc/patroni/patroni.yaml "$@"
