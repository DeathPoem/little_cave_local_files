#!/bin/bash
echo "you want enable or disable? [e/d]\n"

while true; do
    xinput list
    read -p "e or d?" ed
    read -p "give the device number" num
    case $ed in
        [Ee]* ) xinput --enable $num; break;;
        [Dd]* ) xinput --disable $num; break;;
        *) echo " please answer e or d";;
    esac
done
