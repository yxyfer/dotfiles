# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

#echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
#echo "The present working directory is `pwd`"

CONFIGS=~/.term_confs
#CONFIGS=/Users/mathieu.rivier/Documents/dotfiles/files/terminal/
export CONFIGS
CUSTOM=$CONFIGS/custom
VM=$CUSTOM/vm

export ZSH=~/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM= $CUSTOM

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
        git
        git-auto-fetch
        zsh-z
        zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh




# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# Man page colors:
export LESS_TERMCAP_mb=$'\e[1;33m'
export LESS_TERMCAP_md=$'\e[1;49m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;94m'

# SOURCES ---
# Get the custom prompt :)
source $CUSTOM/prompt.sh

# SHH-ADD SetUp
source $CUSTOM/ssh_setup.sh

# VM_CRI
source $VM/vm_load.sh
alias vm_ware=$VM/vm_ware.sh
# only use in the vm
alias vmpatch='systemctl restart vmtoolsd.service'

# Git Status alias
alias gs="git status"
# Git gtree alias
alias gtree="git ls-tree -r --name-only HEAD | tree --fromfile"

# test 42sh
alias testbuild="rm -drf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
"

# Alias for 42sh on vm
alias cpytest="python -m venv venv
source venv/bin/activate
pip install pytest pyyaml"

alias spytest="source venv/bin/activate"

alias dpytest="rm -rf __pycache__
rm -rf venv"

alias close="exit 1"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/flex/bin:$PATH"
