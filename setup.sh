#!/bin/bash
# cc @ 2018-06-14 14:55:54

OH_MY_ZSH=$HOME"/.oh-my-zsh"

if [ ! -d "/bin/zsh" ]; then
    sudo apt-get install zsh
    chsh -s /bin/zsh
fi

if [ ! -d $OH_MY_ZSH ]; then
fi

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}
