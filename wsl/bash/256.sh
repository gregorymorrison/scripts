#!/bin/bash -
set -o nounset

for fgbg in 38 48 ; do
    for color in {0..255}; do
        printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
        if [ $(((color + 1) % 6)) == 4 ] ; then
            echo
        fi
    done
    echo
done

exit 0

