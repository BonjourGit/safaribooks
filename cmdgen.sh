#!/bin/bash

playlist=$1
# input is in format "id name" where name can contain spaces
# replace first space with underscore
playlistInfo=${playlist/ /_}
playlistId=`echo ${playlistInfo} | cut -d '_' -f1`
playlistName_=`echo ${playlistInfo} | cut -d '_' -f2`
# replace all space with underscore for playlist name
playlistName=${playlistName_// /_}
echo "nohup ./safaribooks.py --playlist ${playlistId} >> logbook.${playlistName} 2>&1"
