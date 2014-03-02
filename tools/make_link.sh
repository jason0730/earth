#!/bin/bash

file_name=$1
[ -z $file_name ] && echo "bash make_link.sh file_name" && exit 1

file_full_path=`find $SCRIPTS_HOME -name $file_name`
[ -z $file_full_path ] && echo "$file_name 不存在" && exit 1

link_name=`echo $file_name | cut -d '.' -f1`
bin_file_path=`which $link_name`
[ -z $bin_file_path ] && bin_file_path="$HOME/bin/$link_name" || rm $bin_file_path
chmod +x $file_full_path
ln -v -s $file_full_path $bin_file_path 
