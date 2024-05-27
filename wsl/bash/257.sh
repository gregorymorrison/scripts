#!/bin/bash

for i in {0..15}; do
    printf '\e[48;5;%dm%3d ' $i $i;
done
printf '\e[0m\n';

for h in {0..5}; do
    for i in {0..5}; do
        for j in {16..21}; do
            let x=$((($h * 6) + ($i * 36) + $j))
            printf '\e[48;5;%dm%3d ' $x $x
        done
    done
    printf '\e[0m\n';
done

for i in {232..255}; do
    printf '\e[48;5;%dm%3d ' $i $i;
done
printf '\e[0m\n';

