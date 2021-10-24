#! /bin/bash

username=$(whoami)
now=$(date +%s)
mins_input=$1
files_to_archive=""

for file in "/home/$username"/*
do
    if [ -f $file ]; then
        date_modified=$(date -r $file +%s)
        diff=$((now-date_modified))
        mins=$((diff/60))
        if [ $mins -le $mins_input ]; then
            files_to_archive+="$(basename $file) "
        fi
    fi
done

cd "/home/$username"
tar -cvf backup.tgz $files_to_archive
