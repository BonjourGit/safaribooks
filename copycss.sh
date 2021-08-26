#!/bin/bash

BOOK="Books/"
OEBPS="/OEBPS"
STYLE="/OEBPS/Styles"
OIFS="$IFS"
IFS=$'\n'
for bookdir in `ls ${BOOK}`; do
    echo $bookdir
    playlistBookDir=`find ./Playlists/ -name ${bookdir}`
    echo $playlistBookDir
    ls -l "${BOOK}${bookdir}${STYLE}"
    if [ $? -ne 0 ]; then
        exit 1
    fi
    ls -l "${playlistBookDir}${STYLE}"
    if [ $? -ne 0 ]; then
        exit 1
    fi
    set -x
    cp -r ${playlistBookDir}${STYLE} ${BOOK}${bookdir}${OEBPS}
    set +x
done
IFS="$OIFS"
echo "Completed"
