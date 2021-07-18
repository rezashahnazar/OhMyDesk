#! /bin/bash

DESKTOP="$HOME/Desktop"
DEF_NAME="OhMyDesk"
TIME=$(date | awk '{print $4}')

# making new directory 
mkdir "$DESKTOP/$DEF_NAME-$TIME"


############## END OF LESSON 1 ##############

# finding the name of the made directory
NEW_LS=$(ls -t "$DESKTOP")
DIR_NAME=$(echo "$NEW_LS" | awk 'NR==1{print $1}')

# making subDirectories
mkdir "$DESKTOP/$DIR_NAME/Documents"
mkdir "$DESKTOP/$DIR_NAME/Photos"
mkdir "$DESKTOP/$DIR_NAME/Media"
mkdir "$DESKTOP/$DIR_NAME/OtherFiles"
mkdir "$DESKTOP/$DIR_NAME/Folders"