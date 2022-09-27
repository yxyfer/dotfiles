#!/bin/sh 

# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#
# Name:		custom_messages
# Author:	Mathieu Rivier
# Version:	1.0
#
# Custom messages throughout my terminal.
#
# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

info_message()
{
    echo "[\e[34m$1\e[39m] $2"
}

pass_message()
{
    echo "[\e[32mPASS\e[39m] $1"
}

fail_message()
{
    echo "[\e[31mFAIL\e[39m] $1"
}

check_success_message()
{
    if [ "$1" -eq 0 ]; then
        pass_message "succeeded $2"
    else
        fail_message "Failed $2"
        STATUS=1
    fi
}

end_message()
{
    if [[ $1 -eq 0 ]]; then
         echo "[\e[32mPASS\e[39m] $2 installed."
         return 0;
    else
        echo "[\e[31mFAIL\e[39m] problem while installing $2."
        return 1;
    fi
}
