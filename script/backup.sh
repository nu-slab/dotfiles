#!/bin/bash

# set -x
cd `dirname $0`
cd ../config
echo -e "\n\e[33;1m✨ Move to \"$(pwd)\"\e[0m\e[33m"


echo -e "\n\e[32;1m💾 Backup existing files\e[0m\e[32m"
for dotfile in `find . -type f`
do
    if [ -f ${HOME}/${dotfile} ] && [ ! -L ${HOME}/${dotfile} ]
    then
        mv -v ${HOME}/${dotfile} ${HOME}/${dotfile}.backup
    fi
done

