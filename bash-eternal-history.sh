source ${BASH_SOURCE[0]%/*}/bash-preexec.sh

preexec() {
    if [ -n "$MC_SID" ]; then return; fi # disable inside Midnight Commander
    ENABLE_PRECMD="yes"
    { printf "$$ $USER %(%s)T - " -1 ; history 1 ; } >> ~/.bash_eternal_history
}

precmd() {
    if [ -n "$MC_SID" ]; then return; fi # disable inside Midnight Commander
    if [ -n "$ENABLE_PRECMD" ]
    then
        { printf "$$ $USER - %(%s)T " -1 ; history 1 ; } >> ~/.bash_eternal_history
        unset ENABLE_PRECMD
    fi
}
