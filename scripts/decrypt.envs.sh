#!/bin/bash
directory=$PWD
file_type="*.gpg"
passphrase=$PASSPHRASE
find "$directory" -type f -name "$file_type" -not -path "$directory/node_modules/*" | while read -r file; do
    fileName="${file%.*}"
    base=$(basename "$fileName")
    echo $file
    new_file_path="${file%.gpg}"
    gpg --batch --quiet --yes --passphrase $passphrase -o $new_file_path -d $file
done