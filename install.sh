#!/bin/sh
# AUTHOR: Mathieu Rivier
# INSTALL dotfiles
# use those commands from the Coding setup folder
source files/terminal/custom/custom_messages.sh

CONFIGS=$(pwd)/files
VIM_PATH=$CONFIGS/vim
TERM_CONFIG_PATH=$CONFIGS/terminal/zshrc_config.sh


install_vim()
{
    if [ ! -d ~/.old_term_profiles ]; then
        mkdir ~/.old_term_profiles
        pass_message "CRAT" "created .old_term_profiles"
    fi

    info_message "INST" "Vim rc config"
    if [ -d ~/.vim ]; then
        info_message "MOVE" "moving old /.vim folder config"
        mv ~/.vim ~/.old_term_profiles/.vim

        if [ $? -eq 0 ]; then
            pass_message "MOVE" "Moved old /.vim folder to .old_term_profiles"
        else
            fail_message "MOVE" "Could not move old /.vm folder to .old_term_profiles"
        fi
    fi

    if [ -f ~/.vimrc ]; then
        info_message "Move" "moving old .vimrc config"
        mv ~/.vimrc ~/.old_term_profiles/

        if [ $? -eq 0 ]; then
            pass_message "MOVE" "Moved old /.vimrc file to .old_term_profiles"
        else
            fail_message "MOVE" "Could not move old /.vimrc file to .old_term_profiles"
        fi
    fi

    cp -r files/vim/.vim ~/
    cp files/vim/.vimrc ~/
    pass_message "INST" "Installed vim config"

}

install_term()
{
    info_message "INST" "Terminal Config"

    ssh-add

    if [ -d ~/.oh-my-zsh ]; then
        pass_message "PASS" "oh-my-zsh already installed."
    else
        info_message "DWLD" "installing Oh-my-zsh"
        git clone git@github.com:ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    fi

    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-z ]; then
        pass_message "PASS" "zsh-z already installed."
    else
        info_message "DWLD" "installing zsh-z"
        git clone git@github.com:agkozak/zsh-z.git ~/.oh-my-zsh/custom/plugins/zsh-z
    fi

    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        pass_message "PASS" "zsh-syntax-highlighting already installed."
    else
        info_message "DWLD" "installing zsh-syntax-highlighting"
        git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
        mv zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins
    fi

    info_message "INST" "ZSHRC CONFIG"
    echo "source $TERM_CONFIG_PATH" > ~/.zshrc
    source ~/.zshrc

    end_message "term profile";
}

install_configs()
{
    install_vimrc
    $RET=$?
    if [[ $RET -eq 0 ]]; then
        install_term
        $RET=$?
    fi

    end_message "vim and term profiles"
}
