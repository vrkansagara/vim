#!/usr/bin/env bash
# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)

CURRENT_DATE="$(date "+%Y%m%d%H%M%S")"
export DEBIAN_FRONTEND=noninteractive

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note       :- Change dns for latency improvement
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
echo -e "\n" 
echo "$0 execution ... [STARTED - ${CURRENT_DATE}]"

if [ -f "/etc/resolv.conf" ]; then
    # Lets backup the resolver
    ${SUDO} cp /etc/resolv.conf /etc/resolv-${CURRENT_DATE}.conf

  #  echo "nameserver 1.1.1.1" | ${SUDO} tee /etc/resolv.conf
  #  echo "nameserver 8.8.8.8" | ${SUDO} tee -a /etc/resolv.conf
  #  echo "nameserver 8.8.4.4" | ${SUDO} tee -a /etc/resolv.conf
  #
  # Change system dns to public dns
  echo "# cloudflare.com (https://1.1.1.1/help)" | ${SUDO} tee /etc/resolv.conf >/dev/null
  echo "nameserver 1.1.1.1" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 1.0.0.1," | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 2606:4700:4700::1111" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 2606:4700:4700::1001" | ${SUDO} tee -a /etc/resolv.conf >/dev/null

  echo "# Google DNS" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 8.8.8.8" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 8.8.4.4" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 2001:4860:4860::8888" | ${SUDO} tee -a /etc/resolv.conf >/dev/null
  echo "nameserver 2001:4860:4860::8844" | ${SUDO} tee -a /etc/resolv.conf >/dev/null

  # change file attributes on a Linux file system
  #  ${SUDO} chattr +i /etc/resolv.conf >/dev/null
  # Use the realpath for the resolver and modified the attributes to avoid symbolic link issue.
  ${SUDO} chattr -f +i "$(realpath /etc/resolv.conf)" >/dev/null
fi

echo "$0 execution ... [DONE - ${CURRENT_DATE}]"
