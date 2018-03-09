if [ -z "$ZSH" ]
then
    source ${BASH_SOURCE[0]%/*}/bash-preexec.sh
fi

BEH_LOG_BEFORE_COMMAND=yes
BEH_LOG_AFTER_COMMAND=yes

preexec() {
    if [ "$BEH_LOG_BEFORE_COMMAND" != "yes" ]; then return; fi
    if [ -n "$MC_SID" ]; then return; fi # disable inside Midnight Commander
    BEH_ENABLE_PRECMD="yes"
    if [ "${BASH_VERSINFO[0]}" -gt 3 ]
    then
        { printf "$$ $USER %(%s)T - " -1 ; history 1 ; } >> ~/.bash_eternal_history
    else
        { echo -n "$$ $USER $(date +%s) - " ; history 1 ; } >> ~/.bash_eternal_history
    fi
}

precmd() {
    if [ "$BEH_LOG_AFTER_COMMAND" != "yes" ]; then return; fi
    if [ -n "$MC_SID" ]; then return; fi # disable inside Midnight Commander
    if [ -z "$BEH_ENABLE_PRECMD" ]; then return; fi

    if [ "${BASH_VERSINFO[0]}" -gt 3 ]
    then
        { printf "$$ $USER - %(%s)T " -1 ; history 1 ; } >> ~/.bash_eternal_history
    else
        { echo -n "$$ $USER - $(date +%s) " ; history 1 ; } >> ~/.bash_eternal_history
    fi
    unset BEH_ENABLE_PRECMD
}
