#!/bin/sh -eu
# I'm often dual-booting Windows alongside Ubuntu. It's easier to make Ubuntu
# match the Windows clock, even though Windows is "wrong".
#
# http://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/
#
# Also, skip this when testing, as docker doesn't seem to like it
if [ -z "$CI" ]; then
  timedatectl set-local-rtc 1 --adjust-system-clock
else
  echo "CI env: skipping timedatectl (windows clock)"
fi
