# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Debugging lines
#echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
#echo "The present working directory is `pwd`"

CONFIGS=~/.term_confs
export CONFIGS

CUSTOM=$CONFIGS/custom

export ZSH=~/.oh-my-zsh


# CUSTOM THEME - NOT USING ZSH!
# Get the custom prompt :)

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM= $CUSTOM

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

plugins=(
        git
        git-auto-fetch
        zsh-z
        zsh-syntax-highlighting
        zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh

source $CUSTOM/prompt.sh
########### User configuration ###############

# export MANPATH="/usr/local/man:$MANPATH"
# Man page colors:
export LESS_TERMCAP_mb=$'\e[1;33m'
export LESS_TERMCAP_md=$'\e[1;49m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;94m'


# Git gtree alias
alias gtree="git ls-tree -r --name-only HEAD | tree --fromfile"
alias close="exit 1"

# Postgres setup
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
export PGHOST="/tmp"
export PGDATA="$HOME/postgres_data"

# JAVA version 

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME; java -version'
alias java11='export JAVA_HOME=$JAVA_11_HOME; java -version'


# Python Alias

alias python='python3'

# Jupyter Lab alias

alias lab='jupyter lab'

# SPARK setup
export SPARK_HOME="/usr/local/Cellar/apache-spark/3.2.1/SPARK"

# Python setup
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export PATH="$PATH:/Users/mathieu.rivier/Library/Application Support/Coursier/bin"

# PlaidML setup
export PLAIDML_NATIVE_PATH=/usr/local/lib/libplaidml.dylib
export RUNFILES_DIR=/usr/local/share/plaidml

source ~/.mattSecrets
