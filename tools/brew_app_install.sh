#!/bin/bash

brew install $1 && echo "brew install $1"  >> $SCRIPTS_HOME/use_brew_init_sys.sh
