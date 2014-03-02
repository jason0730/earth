#!/bin/bash

[ -z $1 ] && echo 'ps_grep_tree process_name' && exit 1
pgrep $1 | xargs -n 1 pstree -p
