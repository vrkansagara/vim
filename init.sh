#!/usr/bin/env bash
set -e # This setting is telling the script to exit on a command error.
if [[ "$1" == "-v" ]]; then
  set -x # You refer to a noisy script.(Used to debugging)
fi

echo " "
CURRENT_DATE=$(date "+%Y%m%d%H%M%S")
export DEBIAN_FRONTEND=noninteractive

if [ "$(whoami)" != "root" ]; then
  SUDO=sudo
fi

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :- Init script
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


echo -e "\033[0mNC (No color)"
echo -e "\033[1;37mWHITE\t\033[0;30mBLACK"
echo -e "\033[0;34mBLUE\t\033[1;34mLIGHT_BLUE"
echo -e "\033[0;32mGREEN\t\033[1;32mLIGHT_GREEN"
echo -e "\033[0;36mCYAN\t\033[1;36mLIGHT_CYAN"
echo -e "\033[0;31mRED\t\033[1;31mLIGHT_RED"
echo -e "\033[0;35mPURPLE\t\033[1;35mLIGHT_PURPLE"
echo -e "\033[0;33mYELLOW\t\033[1;33mLIGHT_YELLOW"
echo -e "\033[1;30mGRAY\t\033[0;37mLIGHT_GRAY"


${SUDO} apt-get install neofetch unzip git  --yes --no-install-recommends

cd /tmp
${SUIDO} rm -rf /tmp/jq $(pwd)/bin/jq
wget https://github.com/stedolan/jq/releases/latest/download/jq-linux64 -O jq
chmod +x /tmp/jq
echo '{"foo": 0}' | /tmp/jq .
mv /tmp/jq $(pwd)/bin


cd /tmp
${SUIDO} rm -rf /tmp/JMESPath $(pwd)/bin/JMESPath
wget https://github.com/jmespath/jp/releases/latest/download/jp-linux-amd64 -O JMESPath
chmod +x /tmp/JMESPath
echo '{"a": "foo", "b": "bar", "c": "baz"}' | /tmp/JMESPath a
mv /tmp/JMESPath $(pwd)/bin

curl -sL https://github.com/Orange-OpenSource/hurl/releases/download/1.8.0/hurl-1.8.0-x86_64-linux.tar.gz | tar xvz -C /tmp/bin

${SUDO} chmod +x $HOME/.vim/bin/*

# Run command at vim and exit
vim -c "PlugUpdate | PlugUpdate | PlugUpgrade | PlugClean |q"

#Helpful to itterate over multiple files using existing vim command
#vim -c "execute 'normal! 1' | execute 'normal! 2'"

composer self-update
rm -rf composer.phar
rm -rf vendor composer.lock
composer update
./vendor/bin/grumphp  git:init
./vendor/bin/grumphp  git:deinit
./vendor/bin/grumphp
./vendor/bin/composer install --prefer-dist --no-scripts --no-progress --no-interaction --no-dev
${SUDO} npm i -g npm@latest intelephense@latest livereloadx yarn
yarn set version latest

# update coc-nvim plugines
#echo "Wait for 2 minutes, coc-nvim plugines is started updating"
#vim -c 'CocUpdateSync|q'
#echo "Add intelephense license here"
#node -e "console.log(os.homedir() + '/intelephense/licence.txt')"

