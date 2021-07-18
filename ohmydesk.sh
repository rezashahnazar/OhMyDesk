#! /bin/bash

#in order to fix the problem than space in filenames made mistake in iterating ls result.
IFS=$'\n'

DESKTOP="$HOME/Desktop"
DEF_NAME="OhMyDesk"
# defining the -n arg
if [ "$1" == "-n" ]
then
    read -r -p "Do you really want to choose a name? [Y/n]" YN
    case $YN in
        [yY] | [yY][eE][sS]) read -r -p "Choose a name: " DEF_NAME;;
        [nN] | [nN][oO]) echo "So, Please run the program without the -n option."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
fi

TIME=$(date | awk '{print $4}')

# making new directory and saving its name
mkdir "$DESKTOP/$DEF_NAME-$TIME"
NEW_LS=$(ls -t "$DESKTOP")
DIR_NAME=$(echo "$NEW_LS" | awk 'NR==1{print $1}')

# making subDirectories
mkdir "$DESKTOP/$DIR_NAME/Documents"
mkdir "$DESKTOP/$DIR_NAME/Photos"
mkdir "$DESKTOP/$DIR_NAME/Media"
mkdir "$DESKTOP/$DIR_NAME/OtherFiles"
mkdir "$DESKTOP/$DIR_NAME/Folders"

DOCS=(doc docx txt pdf)
IMG=(png jpeg jpg gif)
MEDIA=(mp3 mp4 mov mkv)

# add slash afte directory names in ls by -p
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

# touch 1.txt newd.docx aplle.png mkd.mp4 ddose.txt lde.mkv dwwe3.txt fjre.pdf ewewfe.mp3 few4few.html lekirfk.jpeg dekjrfi.gif wk3nvfj.png rjen3nf.mov ewdmedwier.doc ewnfjr.css ejewfr.jpg wjefjr3.png denrn.doc ennrj3.txt dewnennr.mp3 fnrnejrfn.mp4 fnrnwnwf.mkv fnrnjw.txt dmenrfroq.js fnrbnwbir.png dneuejnr.pdf emenrjkr.jpg enenejfhwefr.gif dnejwjf.mp3 fnrjwju4if.mp4 fnrjnw.mp3 fnrjwerifv.mp3 fnjwne.txt djenbwbg.doc enewrnwri.mp4 del.txt demwnfnr.docx emewnr.html dewqneir.mov fndwewoef.mp4 fnejwin.png fnejwnfjew.mp4 fnenwaor.pdf enwjejfnerw.jpg enewnwnfriwe.mp3 fnfrjwjrf.pdf enwqenari.mkv enewruiqer.png ewfneuwerhwe.png ewfnirjrfnf.mp4 ferwjjrfur.mp4 fniewriw.mp3 fwnwerwer.pdf dfewioelr.png dewminq3.png fewn.txt dewde.html dwnn32jmferw.mov enfewnef.mp4 fenwnwjurwf.mp4