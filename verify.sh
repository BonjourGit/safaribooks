#!/bin/bash

# Examples:
#
# verbose (print book info)
# ./verify.sh <playlist id> --verbose
#
# concise (summary only)
# ./verify.sh <playlist id>
#
# To verify all playlists:
# ./safaribooks.py --getplaylists | grep Playlist | cut -d ":" -f2 | xargs -d '\n' -I '{}' ./verify.sh {}
./safaribooks.py --book-info-retry 10 --playlist $@ --verify
