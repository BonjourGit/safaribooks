#!/bin/bash

# Argument is one-liner "Id<space>Name" which is the output of
# './safaribooks.py --getplaylists' with some pre-processing
# Id: a hexadecimal playlist id string assigned by oreilly.com
# Name: playlist name set by user, can contain spaces
playlist=$1

# replace first space with underscore
playlistInfo=${playlist/ /_}

playlistId=`echo ${playlistInfo} | cut -d '_' -f1`
playlistName_=`echo ${playlistInfo} | cut -d '_' -f2`

# replace all space with underscore within playlist name
playlistName=${playlistName_// /_}

# Create a command line that downloads the playlist as a background job
# Copy & paste to use
echo "nohup ./safaribooks.py --book-info-retry 10 --html-retry 10 --playlist ${playlistId} >> logbook.${playlistName} 2>&1 &"

# Calling this script for all playlists
# ./safaribooks.py --getplaylists | grep Playlist | cut -d ":" -f2 | xargs -d '\n' -I '{}' ./cmdgen.sh {}
# append '> filename' to redirect the output to a file

