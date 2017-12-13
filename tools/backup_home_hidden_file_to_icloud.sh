#!/bin/bash

function move_hidden_files_to_icloud() {
    local filename=$1
    local icloudpath=$2
    local shortname=`echo -n $filename | cut -d '.' -f2-`

    test ! -L "$HOME/$filename" && test ! -e "$icloudpath/$shortname" && mv -v "$HOME/$filename" "$icloudpath/$shortname" && echo "move done"
}

function link_icloud_dir_to_home_hidden_file() {
    local shortname=$1
    local icloudpath=$2
    test ! -e "$HOME/.$shortname" && ln -v -s  "$icloudpath/$shortname" "$HOME/.$shortname" && echo "create link done"
}

[ -z $1 ] && echo "please input directory name" && exit 1

icloudpath="$HOME/Library/Mobile Documents/com~apple~CloudDocs/$1"
test ! -d "$icloudpath" && echo "[$icloudpath] no such Directory" && exit 1

ls -a $HOME/ | grep '^\.' | grep -v '^.Trash$' | grep -E -v  '^\.+$' | while read filename
do
    move_hidden_files_to_icloud "$filename" "$icloudpath"
done

ls "$icloudpath" | grep -v '^__home_dir__$' | while read shortname
do
    link_icloud_dir_to_home_hidden_file "$shortname" "$icloudpath"
done
