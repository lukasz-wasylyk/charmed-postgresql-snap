#!/bin/bash

# For security measures, applications should not be run as sudo.
export LOCPATH="${SNAP}"/usr/lib/locale
export PGDATA=$SNAP_COMMON/data

export USER_ID="584788" # hack - we need to make sure we can run setpriv. Maybe we can create some user instead in context of snap only ?
"${SNAP}/usr/bin/setpriv" --clear-groups --reuid $USER_ID --regid $USER_ID -- "${SNAP}/usr/lib/postgresql/14/bin/postgres" -k /tmp -D "${PGDATA}"
