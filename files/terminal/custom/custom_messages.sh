#!/bin/sh
# AUTHOR: Mathieu Rivier
# Custom messages throughout my terminal.

info_message()
{
    echo "[\e[34m$1\e[39m] $2"
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

pass_message()
{
    echo "[\e[32m$1\e[39m] $2"
}


fail_message()
{
    echo "[\e[31m$1\e[39m] $2"
}
