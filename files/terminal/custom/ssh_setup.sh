#!/bin/sh

create_init_dir()
{
    if [ -d "/tmp/is_init/" ]; then
        echo "[\e[32mPASS\e[39m] is_init directory exists."
    else
        echo "[\e[34mCREAT\e[39m] creating directory is_init in /tmp/"
            mkdir /tmp/is_init
        if [ -d "/tmp/is_init/" ]; then
            echo "[\e[32mPASS\e[39m] created directory is_init in /tmp/"
        else
            echo "[\e[31mFAIL\e[39m]] failed creating directory"
        fi
    fi
}

if [[ -d "/tmp/is_init" &&  "$(ls -A /tmp/is_init/)" ]]; then
    echo "[\e[32mPASS\e[39m] ssh-add is up and runnning."
else
    create_init_dir
    echo "[\e[34mCREAT\e[39m] ssh-add init."
    ssh-add -q
    RET=$?
    if [ $RET -eq 0 ]; then
        mktemp -q /tmp/is_init/is_init_ssh_XXX
        echo "[\e[32mPASS\e[39m] ssh-add is now runnning."
    else
        echo "[\e[31mFAIL\e[39m] ssh-add was not set up."
    fi
fi
