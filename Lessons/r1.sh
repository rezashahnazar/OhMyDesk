#! /bin/bash

DESKTOP="$HOME/Desktop"
DEF_NAME="OhMyDesk"
TIME=$(date | awk '{print $4}')

# making new directory 
mkdir "$DESKTOP/$DEF_NAME-$TIME"
