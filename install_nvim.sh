#!/bin/bash

# check do we need sudo 
if [[ $(id -u) > 0 ]]; then 
    SUDO="sudo"
else 
    SUDO=""
fi

# Install packages
$SUDO apt update
$SUDO apt-get install -y curl git xclip

# CHECK FOR ripgrep !!!!!!!!!!!!!!!!!!
# install ripgrep
ripgrep_version="13.0.0"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${ripgrep_version}/ripgrep_${ripgrep_version}_amd64.deb
$SUDO dpkg -i ripgrep_${ripgrep_version}_amd64.deb
rm ripgrep_${ripgrep_version}_amd64.deb 

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
$SUDO mv squashfs-root/ /opt/nvim
rm nvim.appimage


# Check is default vim is installed 
if [[ -f "/usr/bin/vim" ]]; then
    echo "WARNING! found vim already installed in the system!"
    echo "Moving it to vim.bak file."
    $SUDO mv /usr/bin/vim /usr/bin/vim.bak
fi

# make "vim" launch nvim
$SUDO ln -s /opt/nvim/AppRun /usr/bin/vim


# install vim.plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# CHECK FOR NODE !!!!!!!!!!!!!!!!!!!
# install node.js for LSP
curl -L  install-node.now.sh/lts -o install_node.sh
$SUDO bash install_node.sh -y
rm install_node.sh

# copy configs to .config
conf_dir="${XDG_DATA_HOME:-$HOME/.config/}"
if [[ ! -f $conf_dir ]]; then
    mkdir -p $conf_dir
fi
cp -r nvim/ $conf_dir

# download font for devicons
fonts_dir="${XDG_DATA_HOME:-$HOME/.local/share/fonts/}"
mkdir -p $fonts_dir
curl -fLo "${fonts_dir}Fira.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete%20Mono.ttf


# VIM setups
vim --headless +'PlugInstall' +qall
# COC UNINSTALL!!
vim --headless +'CocInstall -sync coc-json coc-sh coc-yaml' +qall
# ADD COC-PYRIGHT
