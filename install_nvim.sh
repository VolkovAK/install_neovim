#!/bin/bash

# check do we need sudo 
if [[ $(id -u) > 0 ]]; then 
    SUDO="sudo"
else 
    SUDO=""
fi

# Install packages
$SUDO apt update
$SUDO apt-get install -y curl git xclip make gcc

# install ripgrep
if ! command -v rg &> /dev/null ; then
    ripgrep_version="13.0.0"
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/${ripgrep_version}/ripgrep_${ripgrep_version}_amd64.deb
    $SUDO dpkg -i ripgrep_${ripgrep_version}_amd64.deb
    rm ripgrep_${ripgrep_version}_amd64.deb 
fi

# install fd
if ! command -v fd &> /dev/null ; then
    fd_version="8.3.2"
    curl -LO https://github.com/sharkdp/fd/releases/download/v${fd_version}/fd_${fd_version}_amd64.deb
    $SUDO dpkg -i fd_${fd_version}_amd64.deb
    rm fd_${fd_version}_amd64.deb 
fi


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

# install node.js for LSP
if ! command -v node &> /dev/null ; then
    echo Installing node...
    curl -L  install-node.now.sh/lts -o install_node.sh
    $SUDO bash install_node.sh -y
    rm install_node.sh
fi

# download font for devicons
echo Installing fonts...
fonts_dir="${XDG_DATA_HOME:-$HOME/.local/share/fonts/}"
mkdir -p $fonts_dir
curl -fLo "${fonts_dir}Fira.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Light/complete/Fira%20Code%20Light%20Nerd%20Font%20Complete%20Mono.ttf

# copy configs to .config
conf_dir="${XDG_DATA_HOME:-$HOME/.config/}"
if [[ ! -f $conf_dir ]]; then
    mkdir -p $conf_dir/nvim/
fi
cp nvim/init.vim $conf_dir/nvim/

# VIM setups
echo "Installing plugins and Coc basic plugins"
vim --headless +'PlugInstall' +qall
vim --headless +'CocInstall -sync coc-json coc-sh coc-yaml' +qall


# make copy/paste work over ssh
read -p "Do you want use vim buffer over ssh? [Y/n]" -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "add ForwardX11 in ssh config for copy/paste"
    mkdir -p $HOME/.ssh
    echo "ForwardX11 yes" >> $HOME/.ssh/config
fi


read -p "Do you want install Pyright? (for python) [Y/n]" -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "Installing Pyright"
    vim --headless +'CocInstall -sync coc-pyright' +qall
fi

read -p "Do you want install clangd? (for C++) [Y/n]" -n 1 -r
echo    
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    echo "Installing coc-clangd"
    vim --headless +'CocInstall -sync coc-clangd coc-cmake' +qall
    
    echo "Installing clangd"
    echo "." > /tmp/cpp_temp.cpp
    vim /tmp/cpp_temp.cpp --headless +'CocCommand clangd.install'&   # DOES NOT WORK IN DOCKER
    pid=$!
    sleep 20
    rm /tmp/cpp_temp.cpp
    kill -9 $pid
fi

cp -r nvim/plugin $conf_dir/nvim/
