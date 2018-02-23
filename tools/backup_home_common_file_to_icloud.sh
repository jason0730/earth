#!/bin/bash

############################## functions ##############################

function move_files_to_icloud() {
    local fullname=$1
    local icloudpath=$2

    test ! -L "$HOME/$fullname" \
    && test ! -e "$icloudpath/$fullname" \
    && mv -v "$HOME/$fullname" "$icloudpath/$fullname" \
    && echo "move done"
}

function link_icloud_dir_to_home_file() {
    local fullname=$1
    local icloudpath=$2

    test -e "$icloudpath/$fullname" \
    && test ! -e "$HOME/$fullname" \
    && ln -v -s  "$icloudpath/$fullname" "$HOME/$fullname" \
    && echo "create link done"
}


############################## process ##############################

[ -z $1 ] && echo "please input directory name" && exit 1

icloudpath="$HOME/Library/Mobile Documents/com~apple~CloudDocs/$1"
backup_list="$icloudpath/.backup_list"

test ! -f "$backup_list" && echo ".backup_list not found" && exit 1
test ! -d "$icloudpath" && echo "[$icloudpath] no such Directory" && exit 1

cat "$backup_list" | grep -v -E '^\s+$' | while read fullname
do
    move_files_to_icloud "$fullname" "$icloudpath"
done

ls "$icloudpath" | while read fullname
do
    link_icloud_dir_to_home_file "$fullname" "$icloudpath"
done
