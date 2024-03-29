#!/usr/bin/env bash
set -e # This setting is telling the script to exit on a command error.
if [[ "$1" == "-v" ]]; then
	set -x # You refer to a noisy script.(Used to debugging)
fi

echo " "
CURRENT_DATE=$(date "+%Y%m%d%H%M%S")
export

if [ "$(whoami)" == "root" ]; then
	echo "This script does not support root level execution."
	return 1
fi

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- vallabhdas kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :- Logout of the current user(DONT USE FOR THE ROOT)
#				 kill -9 -1 kills all processes owned by the user executing it,
#				 except for the shell you executed it from, with exception to
#				 root users.

echo "Current user is going to logout $USER  "

sleep 5

kill -9 -1

return 0
