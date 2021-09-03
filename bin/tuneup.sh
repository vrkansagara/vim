#!/usr/bin/env bash

# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)
export DEBIAN_FRONTEND=noninteractive

if [ "(whoami)" != "root" ]; then
	SUDO=sudo
fi

CURRENT_DATE=$(date "+%Y%m%d%H%M%S")

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :-
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 # 1. Clear PageCache only.
 # sync; echo 1 > /proc/sys/vm/drop_caches
 # sudo sysctl vm.drop_caches=1
 # 2. Clear dentries and inodes.
 # sync; echo 2 > /proc/sys/vm/drop_caches
 # sudo sysctl vm.drop_caches=2
 # 3. Clear PageCache, dentries and inodes.
 # sync; echo 3 > /proc/sys/vm/drop_caches
 # sudo sysctl vm.drop_caches=3
# Note, we are using "echo 3", but it is not recommended in production instead
# use "echo 1"

# drop_caches
# Writing to this will cause the kernel to drop clean caches, as well as
# reclaimable slab objects like dentries and inodes.  Once dropped, their
# memory becomes free.
${SUDO} echo "echo 3 > /proc/sys/vm/drop_caches"

#Clear Swap Space in Linux?
${SUDO}  swapoff -a && ${SUDO} swapon -a

${SUDO} rm -rfv ~/.cache/thumbnails
${SUDO} rm -rfv ~/.mozilla
${SUDO} rm -rfv ~/.cache/mozilla
# ${SUDO} rm -rfv ~/.config/google-chrome

# cp -r -v ~/.config/google-chrome ~/.config/google-chromebackup

# /etc/sysctl.conf

# swappiness
# This control is used to define how aggressive the kernel will swap
# memory pages.  Higher values will increase aggressiveness, lower values
# decrease the amount of swap.  A value of 0 instructs the kernel not to
# initiate swap until the amount of free and file-backed pages is less
# than the high water mark in a zone.
# The default value is 60.
${SUDO} sysctl -w vm.swappiness=10

# This percentage value controls the tendency of the kernel to reclaim
# the memory which is used for caching of directory and inode objects (Default
# =100)
sysctl -n vm.vfs_cache_pressure
${SUDO} sysctl -w vm.vfs_cache_pressure=500

# Print default value
# vm.dirty_background_ratio=10
# vm.dirty_ratio=20
sysctl -n vm.dirty_background_ratio
${SUDO} sysctl -w vm.dirty_background_ratio=20

# Native file system watcher for Linux
cat /proc/sys/fs/inotify/max_user_watches
${SUDO} sysctl -w fs.inotify.max_user_watches = 524288

${SUDO} sysctl -p


#set ulimit to 2 GB for current user
# ulimit -v 2048000
${SUDO} ulimit -v 8192000 # 8 GB for current user
# find -name '*.sh' -exec ls -lA {} +
# https://gist.github.com/juanje/9861623
#clear up system cache
# ${SUDO} apt install default-jre default-jdk --no-install-recommends
# ${SUDO} apt install --reinstall --no-install-recommends gnome-control-center
# ${SUDO} apt-get install cgroup-tools cgroup-lite cgroup-tools cgroupfs-mount libcgroup1

#Stoping unwanted services

${SUDO} service bluetooth stop
${SUDO} service php8.0-fpm stop
${SUDO} service --status-all | grep +

# Finally check with system log if any process is out of memory
${SUDO} grep -i -r 'out of memory' /var/log/

${SUDO} apt-get install procps
# Print virtual memory status
# ${SUDO} vmstat -sS M

# Inspect current date logs
# ${SUDO} grep -ir $(date "+%b %d") /var/log/syslog
${SUDO} apt autoremove
${SUDO} apt update
${SUDO} apt upgrade -V
${SUDO} apt-get -y clean
${SUDO} apt-get -y autoclean
${SUDO} apt-get -y autoremove --purge
# https://itectec.com/ubuntu/ubuntu-install-cgconfig-in-ubuntu-16-04/

# Clean up journalctl (Free up some space)
# journalctl --vacuum-size=500M
${SUDO} journalctl --vacuum-time=2d

