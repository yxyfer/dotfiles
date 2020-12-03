#!/bin/sh
# AUTHOR: Mathieu Rivier
# INSTALL dotfiles
# use those commands from the Coding setup folder
CONFIGS="$(dirname $(dirname $(realpath $0)))/dotfiles/files"
VIM_PATH=$CONFIGS/vim
TERM_CONFIG_PATH=$CONFIGS/terminal/configs.sh

check_vim_profiles()
{
    if [[ -f ~/.vimrc ]]; then
        mv ~/.vimrc ~/.old_profiles;
        [[ $? = 0 ]] || return 1;
        echo "old .vimrc moved to .old_profiles";
    fi

    if [[ -d ~/.vim ]]; then
        mv ~/.vim ~/.old_profiles;
        [[ $? = 0 ]] || return 1;
        echo "old .vim moved to .old_profiles";
    fi
}

check_term_profile()
{
    if [[ -f ~/.zshrc ]]; then
       mv ~/.zshrc ~/.old_profiles;
       [[ $? = 0 ]] || return 1;
       echo "old .zshrc moved to .old_profiles";
    fi
}
copy_old_profiles()
{
    if [[ ! -d ~/.old_profiles ]]; then
        mkdir ~/.old_profiles;
        echo ".old_profiles created";
    fi

    # making old profiles redondent and moving them to the .old_profiles folder
    case "$INSTALL_FILE" in
        "vim")
            check_vim_profiles;
            ;;
        "term")
            check_term_profile
            ;;
        *)
            echo "wrong dotfile";
            return 1;
    esac

    return 0;
}

end_message()
{
    if [[ $RET -eq 0 ]]; then
         echo "[\e[32mINSTALLED\e[39m] $1 installed."
         return 0;
    else
        echo "[\e[31mFAILED\e[39m]problem while installing $1."
        return 1;
    fi
}

install_vimrc()
{
    INSTALL_FILE=vim
    copy_old_profiles
    RET=$?

    if [[ $RET -eq 0 ]]; then
        cp $VIM_PATH/.vimrc ~/.vimrc
        [[ $RET -eq 1 ]] && echo "problem" || cp -r $VIM_PATH/.vim ~/.vim
        RET=$?
    fi

    end_message "vim profile";
}

install_term()
{
    echo "[\e[34mInstalling\e[39m] Terminal Config"

    cd
    ssh-add

    echo "[\e[34mDownloading\e[39m] Oh-my-zsh"
    git clone git@github.com:ohmyzsh/ohmyzsh.git
    mv ohmyzsh/ .oh-my-zsh/

    echo "[\e[34mDownloading\e[39m] zsh-z"
    git clone git@github.com:agkozak/zsh-z.git
    mv zsh-z/ .oh-my-zsh/custom/plugins/

    echo "[\e[34mDownloading\e[39m] zsh-syntax-highlighting"
    git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
    mv zsh-syntax-highlighting .oh-my-zsh/custom/plugins


    echo "[\e[34mInstalling \e[39m] ZSHRC CONFIG"
    echo "source $TERM_CONFIG_PATH" > ~/.zshrc
    source ~/.zshrc

    cd -
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

#exit 0;
