#!/bin/bash

############################## functions ##############################

function move_hidden_files_to_icloud() {
    local fullname=$1
    local icloudpath=$2
    local shortname=`echo -n $fullname | cut -d '.' -f2-`

    test ! -L "$HOME/$fullname" \
    && test ! -e "$icloudpath/$shortname" \
    && mv -v "$HOME/$fullname" "$icloudpath/$shortname" \
    && echo "move done"
}

function link_icloud_dir_to_home_hidden_file() {
    local shortname=$1
    local icloudpath=$2

    test -e "$icloudpath/$shortname" \
    && test ! -e "$HOME/.$shortname" \
    && ln -v -s  "$icloudpath/$shortname" "$HOME/.$shortname" \
    && echo "create link done"
}


############################## process ##############################

[ -z $1 ] && echo "please input directory name" && exit 1

icloudpath="$HOME/Library/Mobile Documents/com~apple~CloudDocs/$1"
ignore_list="$icloudpath/.ignore"

test ! -f "$ignore_list" && touch "$ignore_list"
test ! -d "$icloudpath" && echo "[$icloudpath] no such Directory" && exit 1

#ls -a $HOME/ | grep '^\.' | grep -v '^.Trash$' | grep -E -v  '^\.+$' | while read fullname
ls -a $HOME/ | grep '^\.' | grep -E -v  '^\.+$' | while read fullname
do
    grep "^$fullname$" "$ignore_list" >/dev/null || move_hidden_files_to_icloud "$fullname" "$icloudpath"
done

ls "$icloudpath" | while read shortname
do
    grep "^$shortname$" "$ignore_list" >/dev/null || link_icloud_dir_to_home_hidden_file "$shortname" "$icloudpath"
done
