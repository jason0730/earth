#!/bin/bash

[ -z $1 ] && exit 1
[ ! -d $1 ] && exit 1 

if [ -z $2 ];then
        gittype=`echo $1 | cut -c 4-`

        echo $1 version
        find ./$1 -name "*$gittype-Info.plist" | tee /dev/tty | xargs -n 1  grep -nH -A 1 CFBundleVersion | cut -d '>' -f2- | cut -d '<' -f1 | grep -v Version
else
        info_file=`find ./$1 -name "*$gittype-Info.plist"`
        grep "<string>$2</string>" $info_file || (echo "no match version $2" && exit 1)
        [ $? == 1 ] && exit 1
        new_version=`echo $2 + 2 | bc `
        gsed -n "s|<string>$2</string>|<string>$new_version</string>|" $info_file
        read -p "y/n    " selected_type
        if [[ $selected_type == "y" ]];then
                gsed -i "s|<string>$2</string>|<string>$new_version</string>|" $info_file 
                echo "done"
                grep "<string>$new_version</string>" $info_file
        fi
fi
