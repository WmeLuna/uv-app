#!/bin/bash

RESTORE='\033[0m'
BLACK='\033[00;30m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LBLACK='\033[01;30m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
OVERWRITE='\e[1A\e[K'

function _task {
    if [[ $TASK != "" ]]; then
        printf "${OVERWRITE}${LGREEN} [✓]  ${LGREEN}${TASK}\n"
    fi
    TASK=$1
    printf "${LBLACK} [ ]  ${TASK} \n${LRED}"
}

function _cmd {
    if eval "$1" 1> /dev/null 2> /dev/null; then
        return 0 
    fi
    printf "${OVERWRITE}${LRED} [X]  ${TASK}${LRED}\n"
    while read line; do 
        printf "      ${line}\n"
    done 
    printf "\n"
    exit 1
} 

_task "Sync with GitHub"
    _cmd "git reset --hard" 
    _cmd "git pull"
    _cmd "bash brand.sh"

_task "Run Unblocker"    
    printf "${PURPLE} [-]  This runs in the background ${RESTORE}"
    _cmd "node ."
_task "Reboot machine, unblocker crashed"
    _cmd "busybox reboot"
    _cmd "exit 1"
