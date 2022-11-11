#!/bin/bash

# set -x
cd `dirname $0`
cd ../config
echo -e "\n\e[33;1m✨ Move to \"$(pwd)\"\e[0m\e[33m"


echo -e "\n\e[31;1m🥡 Delete symlinks\e[0m\e[31m"
for dotfile in `find . -type l`
do
    rm -rfv ${HOME}/${dotfile}
done
rm -rfv ${HOME}/.config/vim
rm -rfv ${HOME}/.config/nvim
rm -rfv ${HOME}/.emacs.d

