#!/usr/bin/env bash
# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)

CURRENT_DATE=$(date "+%Y%m%d%H%M%S")
export DEBIAN_FRONTEND=noninteractive

if [ "$(whoami)" != "root" ]; then
	SUDO=sudo
fi

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :-
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo
echo "Current setting is "
${SUDO} cat /sys/module/hid_apple/parameters/fnmode

${SUDO} bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"

# echo options hid_apple fnmode=2 | ${SUDO} tee -a /etc/modprobe.d/hid_apple.conf
# ${SUDO} update-initramfs -u -k all
# ${SUDO} reboot # optional

echo "[DONE] MacBokAir Specific setting updated"
exit 0
