#!/bin/bash
# cc @ 2018-06-14 14:55:54

OH_MY_ZSH=$HOME"/.oh-my-zsh"

which zsh > /dev/null
if [ $? -eq 1 ]; then
    sudo apt-get install zsh
    chsh -s /bin/zsh
fi

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

create_link() {
    from_file=$1
    to_file=$2
    echo $to_file
    if [ ! -f "$to_file" ];then
        ln -s $PWD/$from_file $to_file
        echo "Make soft link from $from_file to $to_file"
    else
        read -p "$to_file is exists, continue will remove your file, continue? [y or n]" _remove
        if [[ $_remove = "y" ]]; then
            rm -fr $to_file
            ln -s $PWD/$from_file $to_file
            echo "Make soft link from $from_file to $to_file"
        fi
    fi
}

if [ ! -d $OH_MY_ZSH ];then
    install_oh_my_zsh
fi

create_link "vim/vimrc" $HOME/".vimrc"
create_link "tmux/tmux.conf" $HOME/".tmux.conf"
create_link "git/gitconfig" $HOME/".gitconfig"
create_link "zsh/zshrc" $HOME/".zshrc"
create_link "git/gitignore" $HOME/".gitignore"
