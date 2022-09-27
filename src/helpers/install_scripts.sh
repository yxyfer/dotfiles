#!/bin/sh 

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#
# Name: install_scripts
# Author:   Mathieu Rivier (yxyfer)
# Version:  2.0
#
# This is a short description (you can add how to use)
#
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# INSTALLATION FUNCTIONS
install_f_git()
{
    # $1 = name
    # $2 = path
    # $3 = link
    if [ -d $2 ]; then
        pass_message "$1 already installed."
        return 0
    else
        info_message "INST" "Installing $1"
        git clone $3 $2
        check_success_message "$?" "installing $1"
    fi
}


install_f_curl()
{
    # $1 = name
    # $2 = path
    # $3 = link

    if [ -d $2 ]; then
        pass_message "$1 already installed."
        return 0
    else
        info_message "INST" "Installing $1"
        /bin/bash -c "$(curl -fLo $2 --create-dirs $3)"
        check_success_message "$?" "installing $1"
    fi
}

link_f_git()
{
    # $1 = name
    # $2 = path
    # $3 = link
    if [ -L $1 ]; then
        rm -i $1
        if [ -e $1 ]; then
            fail_message "failed deleting the link to $1"
            return 1
        else
            pass_message "successfully deleted old link to $1"
        fi
    elif [ -e $1 ]; then
        mkdir ~/.old_confs
        mv $1 ~/.old_confs/
        check_success_message "$?" "LINK" "Moving $1 to ~/.old_confs"
    fi

    info_message "LINK" "Linking $2 to $1"
    ln -s $2 $1
    check_success_message "$?" "successfully linked $2 to $1"
}
