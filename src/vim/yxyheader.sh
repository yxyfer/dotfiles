#!/bin/sh 

# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#
# Name:		yxyheader.sh
# Author:	Mathieu Rivier
# Version:	2.0
#
# Automatically adds the right header for file edited in vim
#
# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if [ "$1" == "py" ]; then
    echo "\"\"\" \n\tName:\t\tname\n\tAuthors:\t$2\n\tVersion:\t1.0\n\n\tThis is a short description\n\"\"\"\n"
fi

if [ "$1" == "sh" ]; then
    echo "#!/bin/sh \n\n# \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n#\n# Name:\t\tname\n# Author:\t$2\n# Version:\t1.0\n#\n# This is a short description (you can add how to use)\n#\n# \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\n"
fi


if [ "$1" == "vim" ]; then
    echo "\" =============================================================================\n\" Name:\t\tname\n\" Author:\t$2\n\" Version:\t1.0\n\"\n\" This is a short description\n\" =============================================================================\n"
fi
