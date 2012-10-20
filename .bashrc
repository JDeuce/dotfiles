export TZ=/usr/share/zoneinfo/America/Winnipeg

if ( which vim > /dev/null )
then
    alias vi=vim
    export EDITOR=vim
    export VISUAL=vim
else
    export EDITOR=vi
    export VISUAL=vi
fi

# fixes problems with long lines overwriting after a win resize
shopt -s checkwinsize

if [ $EUID -ne 0 ]
then
    # green PS1 when not running as root
    PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
else
    # red PS1 when running as root
    PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
fi

# adds color to ls in FreeBSD
export CLICOLOR='yes'

alias grep='grep --color'
