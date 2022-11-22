#!/bin/bash

function weather (){
    curl -fGsS --compressed wttr.in/IAD?0Au
}
function forecast (){
    curl -fGsS --compressed wttr.in/IAD?Au
}
function displayweather () {
	weather
	while sleep 600 ; do x="$( weather 2>&1 )" ; clear ; echo "$x" ; done
}
weather

randimg () {
    word=$( shuf -n 1 /usr/share/dict/words )
    if [ $1 ]; then
        word=$1;
    fi

    curl e.xec.sh/$word?img=true
    echo -e "\n                    \033[1;104m  $word  \033[33m\n"
}
