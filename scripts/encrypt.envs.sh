#!/bin/bash
set -e

directory=$PWD
file_type=".env.*"
fileToIgnore="*.gpg"
passphrase=$PASSPHRASE

find "$directory" -type f -name "$file_type" -not -path "$directory/node_modules/*" ! -name $fileToIgnore | while read -r file; do
    echo "Processing: $file"
    rm $file.gpg
    gpg --batch --yes --quiet --passphrase $passphrase --symmetric $file
done