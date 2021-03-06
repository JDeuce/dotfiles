# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# TZ/Locale settings
export TZ=/usr/share/zoneinfo/America/Winnipeg
export MM_CHARSET=utf8
export LANG=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8
export LC_COLLATE=C

# Editor
if ( which vim > /dev/null )
then
    alias vi=vim
    export EDITOR=vim
    export VISUAL=vim
else
    export EDITOR=vi
    export VISUAL=vi
fi


# History settings
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# fixes problems with long lines overwriting after a win resize
shopt -s checkwinsize

if [ $EUID -ne 0 ]
then
    # green username when not running as root
    PS1='\[\033[01;32m\]'
else
    # red username as root
    PS1='\[\033[01;31m\]'
fi

PS1=$PS1'\u \033[00m\]\[\033[01;34m\]\w\[\033[00m\]'

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
    PS1="${PS1}\$(__git_ps1 ' [\[\e[34;1m\]%s\[\e[0m\]]')"
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
fi

PS1="${PS1} \n\$ "

# adds color to ls in FreeBSD
export CLICOLOR='yes'

alias grep='grep --color'
alias screen='screen -U'

alias rehash='hash -r'

pushd() {
    command pushd "$@" > /dev/null
}
export pushd

alias cd=pushd

export PYTHONSTARTUP=~/.pythonrc.py

markdown_to_man() {

    file=${1--}

    pandoc -s -f markdown_github -t man $file | man -l -
}
alias markman=markdown_to_man


# use 256 color mode
alias tmux="tmux -2"


if [ -f ~/.bashrc-local ]; then
    . ~/.bashrc-local
fi
