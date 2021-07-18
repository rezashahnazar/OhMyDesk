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

############## END OF LESSON 2 ##############

DOCS=(doc docx txt pdf)
IMG=(png jpeg jpg gif)
MEDIA=(mp3 mp4 mov mkv)

# add slash after directory names in ls by -p
LIST=$(ls -p "$DESKTOP")
# ask grep to choose all "without" slash (-v /) = List of files
LIST_FILES=$(echo "$LIST" | grep -v /)


# moving all files to the new folder based on type
for f in $LIST_FILES
do
    if [ "$([[ ${DOCS[*]} =~ $(echo "$f" | cut -d '.' -f2) ]] && echo YES || echo NO)" == "YES" ]
    then
        mv "$DESKTOP/$f" "$DESKTOP/$DIR_NAME/Documents"
    elif [ "$([[ ${IMG[*]} =~ $(echo "$f" | cut -d '.' -f2) ]] && echo YES || echo NO)" == "YES" ]
    then
        mv "$DESKTOP/$f" "$DESKTOP/$DIR_NAME/Photos"
    elif [ "$([[ ${MEDIA[*]} =~ $(echo "$f" | cut -d '.' -f2) ]] && echo YES || echo NO)" == "YES" ]
    then
        mv "$DESKTOP/$f" "$DESKTOP/$DIR_NAME/Media"
    else
        mv "$DESKTOP/$f" "$DESKTOP/$DIR_NAME/OtherFiles"
    fi
done


# ask grep to choose all "with" slash (/) = List of directories
LIST_DIRS=$(echo "$LIST" | grep / | cut -d "/" -f1)
for d in $LIST_DIRS
do
    if [ "$d" != "$DIR_NAME" ]
    then
        mv "$DESKTOP/$d" "$DESKTOP/$DIR_NAME/Folders" 
    fi
done

############## END OF LESSON 3 ##############

