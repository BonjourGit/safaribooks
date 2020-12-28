#!/bin/bash

# Examples:
#
# verbose
# ./verify.sh <playlist id> --verbose
#
# concise
# ./verify.sh <playlist id>
./safaribooks.py --book-info-retry 10 --playlist $@ --verify
