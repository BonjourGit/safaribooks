#!/bin/bash

# Script verifies that:
# 1. a playlist book (epub file) exists locally
# 2. the epub file for a book has a newer file create timestamp
#    than the book's release date
#
# Argument: playlist id
#           --verbose (optional)
#
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
