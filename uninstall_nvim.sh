#!/bin/bash

# check do we need sudo 
if [[ $(id -u) > 0 ]]; then 
    SUDO="sudo"
else 
    SUDO=""
fi


# uninstall 
$SUDO rm /usr/bin/vim
$SUDO rm -r /opt/nvim
conf_dir="${XDG_DATA_HOME:-$HOME/.config/}"
rm -rf $conf_dir/nvim/
rm -rf $conf_dir/coc/
rm -rf $HOME/.vim/


