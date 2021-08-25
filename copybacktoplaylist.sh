#!/bin/bash

OIFS="$IFS"
IFS=$'\n'
for bookdir in `ls Books`; do
    echo $bookdir
    playlistBook=`find ./Playlists/ -name ${bookdir}`
    playlistBookDir=`dirname ${playlistBook}`
    echo $playlistBookDir
    set -x
    cp -r ./Books/${bookdir} ${playlistBookDir}
    set +x
done
IFS="$OIFS"
echo "Completed"
