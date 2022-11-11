#!/bin/bash

# set -x
cd `dirname $0`
cd ../config
echo -e "\n\e[33;1m✨ Move to \"$(pwd)\"\e[0m\e[33m"


echo -e "\n\e[34;1m💡 Create missing directories\e[0m\e[34m"
for dotdir in `find . -type d`
do
    mkdir -pv $HOME/${dotdir}
done


echo -e "\n\e[36;1m🐢 Create symlinks\e[0m\e[36m"
for dotfile in `find . -type f`
do
    ln -sfv $(realpath ${dotfile}) ${HOME}/${dotfile}
done

