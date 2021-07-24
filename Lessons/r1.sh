#! /bin/bash

# This lesson is about $ sign and its 2 main uses.
# $X is for accessing the data stored in the X variable
# $(command) is for accessing the output of a command
# Just hear that have some environment variables like $HOME $PATH $PS1. we don't go into the details of environments.

DESKTOP="$HOME/Desktop"
DEF_NAME="OhMyDesk"
TIME=$(date | awk '{print $4}')

# making new directory 
mkdir "$DESKTOP/$DEF_NAME-$TIME"
