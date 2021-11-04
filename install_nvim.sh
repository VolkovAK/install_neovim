#!/bin/bash

# check do we need sudo 
if [[ $(id -u) > 0 ]]; then 
    SUDO="sudo"
else 
    SUDO=""
fi


# Install packages for building neovim
$SUDO apt update
$SUDO apt-get install -y \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    doxygen \
    git 

git clone https://github.com/neovim/neovim && cd neovim
make CMAKE_BUILD_TYPE=Release
$SUDO make install

# Check is default vim is installed 
if [[ -f "/usr/bin/vim" ]]; then
    echo "WARNING! found vim already installed in the system!"
    echo "Moving it to vim.bak file."
    $SUDO mv /usr/bin/vim /usr/bin/vim.bak
fi

# make "vim" launch nvim
$SUDO ln -s /usr/local/bin/nvim /usr/bin/vim


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl -sL install-node.now.sh/lts | $SUDO bash -y
