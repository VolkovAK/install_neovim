#!/bin/bash

# check do we need sudo 
if [[ $(id -u) > 0 ]]; then 
    SUDO="sudo"
else 
    SUDO=""
fi

# uninstall 
$SUDO rm /usr/local/bin/*vim
$SUDO rm -r /usr/local/share/*vim/
