#!/bin/sh

CUSTOM="$(dirname "$0")"
source $CUSTOM/custom_messages.sh

create_init_dir()
{
    if [ -d "/tmp/is_init/" ]; then
        pass_message "PASS" "is_init directory exists."
    else
        info_message "CREAT" "Creating directory is_init in /tmp"
        mkdir /tmp/is_init

        if [ -d "/tmp/is_init/" ]; then
            pass_message "PASS" "Created directory is_init in /tmp"
        else
            fail_message "FAIL" "failed creating directory is_init"
        fi
    fi
}

if [[ -d "/tmp/is_init" &&  "$(ls -A /tmp/is_init/)" ]]; then
    pass_message "PASS" "ssh-add is up and running."
else
    create_init_dir
    info_message "SETUP" "ssh-add init."
    ssh-add -q
    RET=$?
    if [ $RET -eq 0 ]; then
        mktemp -q /tmp/is_init/is_init_ssh_XXX
        pass_message "PASS" "ssh-add is now running."
    else
        fail_message "FAIL" "ssh-add was not set up."
    fi
fi
