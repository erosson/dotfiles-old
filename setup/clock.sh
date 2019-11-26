#!/bin/sh -eu
# I'm often dual-booting Windows alongside Ubuntu. It's easier to make Ubuntu
# match the Windows clock, even though Windows is "wrong".
#
# http://ubuntuhandbook.org/index.php/2016/05/time-differences-ubuntu-1604-windows-10/
timedatectl set-local-rtc 1 --adjust-system-clock
